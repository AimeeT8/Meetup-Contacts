//
//  ContentView-ViewModel.swift
//  MyMeetupContacts
//
//  Created by Aimee Temple on 2024-07-09.
//

import Foundation
import SwiftUI


@MainActor class ViewModel: ObservableObject {
    @Published var isUnlocked = true
    @Published var authError = ""
    @Published private(set) var meetup: [Contact]
    
    
    let savePathMeetup = URL.documentsDirectory.appending(path: "MyContacts.txt")
    
    init() {
        do {
            let contactData = try Data(contentsOf: savePathMeetup)
            meetup = try JSONDecoder().decode([Contact].self, from: contactData)
            
        } catch {
            meetup = []
        }
    }
    
    func addNewPerson(firstName: String, lastName: String, jobTitle: String, moreInfo: String, inputUIImage: UIImage?) {
        
        guard let imageData = inputUIImage?.jpegData(compressionQuality: 0.8) else { return }
        let newPerson = Contact(id: UUID(), firstName: firstName, lastName: lastName, jobTitle: jobTitle, moreInfo: moreInfo, image: imageData)
        self.meetup.append(newPerson)
        saveMeetup()
        
    }
    
    func saveMeetup() {
        do {
            let personsData = try JSONEncoder().encode(self.meetup)
            try personsData.write(to: savePathMeetup, options: [.atomic, .completeFileProtection])
            print("New contact saved.")
        } catch {
            print("Unable to save data.")
        }
    }
    
    func updateView() {
        self.objectWillChange.send()
    }
    
    func removeRows(at offsets: IndexSet) {
        self.meetup.remove(atOffsets: offsets)
        saveMeetup()
        print("Contact has been deleted.")
    }
    
}









