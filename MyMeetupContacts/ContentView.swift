//
//  ContentView.swift
//  MyMeetupContacts
//
//  Created by Aimee Temple on 2024-07-09.
//
import PhotosUI
import SwiftUI

struct ContentView: View {
    
   @StateObject private var viewModel = ViewModel()
    
    @State var refresh: Bool = false
    @State private var showingEditView = false
    
  
    var body: some View {
        
        NavigationView {
            List {
                ForEach(viewModel.meetup) { person in
                    DetailView(person: person)
                        .padding(-5)
                    
                }
                .onDelete { index in
                    viewModel.removeRows(at: index)
                    
                }
            }
            .navigationTitle("Networking Contacts")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        showingEditView = true
                    } label: {
                        ZStack {
                            Rectangle()
                                .fill(.blue)
                                .frame(width: 300, height: 64)
                                .clipShape(.capsule)
                            Image(systemName: "plus")
                             
                                .foregroundColor(.white)
                                .font(.title)
                        }
                        .padding(.bottom)
                    }
                }
            }
            .sheet(isPresented: $showingEditView) {
                EditView()
            }
            
            
            
            
        }
            }
        }
       
#Preview {
    ContentView()
}
