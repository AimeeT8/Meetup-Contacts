//
//  Contact.swift
//  MyMeetupContacts
//
//  Created by Aimee Temple on 2024-07-09.
//

import Foundation
import SwiftUI
import UIKit


struct Contact: Codable, Equatable, Identifiable  {
    
    var id: UUID
    var firstName: String
    var lastName: String
    var jobTitle: String
    var moreInfo: String
    var image: Data
    
    init(id: UUID, firstName: String, lastName: String, jobTitle: String, moreInfo: String, image: Data) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.jobTitle = jobTitle
        self.moreInfo = moreInfo
        self.image = image
    }
    
    func convert() -> Image {
        let uiImageData = image
        if let uiImage = UIImage(data: uiImageData) {
            return Image(uiImage: uiImage)
        }
        return Image(systemName: "questionmark.square.dashed")
    }
    
    static let exampleImage = UIImage(named: "pic")?.jpegData(compressionQuality: 0.8)
   
    static let example = Contact(id: UUID(), firstName: "Joe", lastName: "Smith", jobTitle: "pilot", moreInfo: "Has worked at Delta Airlines for 10 years. He is a mutal friend of Carla. He gave me the great tips about University of Arizona new flight skills program. He has an active X Account where he talks about pilot innovation and safety tips.", image: exampleImage!)
    
    
   
    
    
    static func <(lhs: Contact, rhs: Contact) -> Bool {
        lhs.lastName < rhs.lastName
    }
    
   
}



