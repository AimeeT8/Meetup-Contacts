//
//  EditView.swift
//  MyMeetupContacts
//
//  Created by Aimee Temple on 2024-07-09.
//

import CoreImage
import PhotosUI
import SwiftUI

struct EditView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel = ViewModel()
    
    @State private var image: Image?
    @State private var inputUIImage: UIImage?
    @State private var savingUIImage: UIImage?
    @State private var pickerItems: PhotosPickerItem?
    @State private var showingImagePicker = false
    @State private var personFirstName = ""
    @State private var personLastName = ""
    @State private var personJobTitle = ""
    @State private var personMoreInfo = ""
    
   
    
     
     
     var body: some View {
         NavigationView {
             VStack {
                 TextField("First name:", text: $personFirstName)
                     .textFieldStyle(.roundedBorder)
                     .padding()
                 TextField("Last name:", text: $personLastName)
                     .textFieldStyle(.roundedBorder)
                     .padding()
                 TextField("Job Title:", text: $personJobTitle)
                     .textFieldStyle(.roundedBorder)
                     .padding()
                 TextField("Extra Info:", text: $personMoreInfo)
                     .textFieldStyle(.roundedBorder)
                     .padding()
                 
                 
                 ZStack {
                     Rectangle()
                         .fill(.secondary)
                         .frame(width: 300, height: 300)
                     Text("Tap to select photo")
                         .foregroundStyle(.white)
                         .font(.headline)
                     image?
                         .resizable()
                         .scaledToFit()
                         .frame(width: 300, height: 300)
                 }
                 .onTapGesture {
                     showingImagePicker = true
                 }
             }
             .onChange(of: inputUIImage) { _ in loadImage() }
             .sheet(isPresented: $showingImagePicker) {
                 PhotosPicker(selection: $pickerItems) {
                     Label("Select a Picture", systemImage: "photo")
                 }
                     
                 
             }
             
             .toolbar {
                 ToolbarItem {
                     Button("Save") {
                         viewModel.addNewPerson(firstName: personFirstName, lastName: personLastName, jobTitle: personJobTitle, moreInfo: personMoreInfo, inputUIImage: savingUIImage)
                         viewModel.updateView()
                         dismiss()
                     }
                     .disabled(inputUIImage == nil)
                     .disabled(personFirstName == "")
                     .disabled(personLastName == "")
                 }
                 ToolbarItem(placement: .cancellationAction) {
                     Button("Cancel", role: .cancel) {
                         dismiss()
                     }
                 }
             }
             
            
         }
        
     }
    
    func loadImage() {
        guard let inputUIImage = inputUIImage else { return }
        image = Image(uiImage: inputUIImage)
        savingUIImage = inputUIImage
    }
    
   
    

    
        
     
 }

#Preview {
    EditView()
}

