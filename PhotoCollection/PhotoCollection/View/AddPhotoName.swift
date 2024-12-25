//
//  AddPhotoName.swift
//  PhotoCollection
//
//  Created by mac on 25/12/24.
//

import SwiftUI

struct AddPhotNameView : View {
    @Binding var photoName: String
    @Binding var isPresented: Bool // Use @Binding to reflect changes to the parent view.
    var onSave: (String) -> Void
    var body: some View {
        ZStack{
            Color.white
                     .ignoresSafeArea() //
            VStack(spacing: 20) {
                Text("Name Your Photo")
                    .font(.title2)
                    .bold()
                
                
                
                TextField("Enter photo name", text: $photoName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                Button(action: {
                    onSave(photoName) // Pass the entered name back to the parent.
                                        isPresented = false 
                   
                }) {
                    Text("Done")
                        .bold()
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .disabled(photoName.isEmpty)
                .padding(.horizontal)
            }
        }
        .padding()
    }
    }

