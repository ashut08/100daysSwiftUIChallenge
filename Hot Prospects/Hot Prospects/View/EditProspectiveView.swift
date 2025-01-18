//
//  EditProspectiveView.swift
//  Hot Prospects
//
//  Created by mac on 19/01/25.
//

import SwiftUI
struct EditProspectiveView :View   {
    @Environment(\.dismiss) var dismiss
       @Environment(\.modelContext) var modelContext

       @State var prospect: Prospect
    
    var body: some View {
        Form {
                   TextField("Name", text: $prospect.name)
                   TextField("Email Address", text: $prospect.emailAddress)
               }
               .navigationTitle("Edit Prospect")
               .toolbar {
                   Button("Save") {
                       try? modelContext.save()
                       dismiss()
                   }
               }    }
    
}
