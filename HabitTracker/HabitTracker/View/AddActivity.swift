import SwiftUI

struct AddActivityView: View {
    @Environment(\.dismiss) var dismiss
    @State private var title = ""
    @State private var description = ""
    @ObservedObject var viewModel: ActivityViewModel // Reference the ViewModel


    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $title)
                TextField("Description", text: $description)
            }
            .navigationTitle("Add New Activity")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                               Button("Cancel") {
                                   dismiss()
                               }
                               .foregroundColor(.red)
                           }
                ToolbarItem(placement: .navigationBarTrailing) {
                                 Button("Save") {
                                     let newActivity = ActivityModel(title: title, description: description)
                                     
                                     if newActivity.title != "" && newActivity.description != "" {
                                         viewModel.addActivity(title: newActivity.title, description: newActivity.description)
                                     }
                                     dismiss()
                                 }
                             }

            }
        }
    }
}
