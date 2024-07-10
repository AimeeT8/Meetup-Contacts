//
//  DetailView.swift
//  MyMeetupContacts
//
//  Created by Aimee Temple on 2024-07-09.
//


import SwiftUI
import UIKit

struct DetailView: View {
    
    let person: Contact
    @State private var image: Image?
    

    
    var body: some View {
        VStack {
            Spacer()
            image?
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .frame(width: 450, height: 450)
                .shadow(radius: 4)
            
                Text("\(person.firstName) \(person.lastName)")
                    .font(.title2)
                
                Text("Job Title: \(person.jobTitle)")
            
            CustomDivider()
                Text(person.moreInfo)
            
                .padding()
            
            
            Spacer()
        }
        .onAppear(perform: loadImage)
    }
    func loadImage() {
        image = person.convert()
        
    }
    }
    
        

#Preview {
    DetailView(person: Contact.example)
}


