import SwiftUI

struct ContentView: View {
    @State private var showingAddActivity = false
    @StateObject var viewModel = ActivityViewModel() // Create the ViewModel

    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.activities) {
                    activity in
                    HStack {
                     
                    
                        VStack(alignment: .leading, spacing: 5) {
                            
                            Text(activity.title)
                                .font(.headline)
                                .foregroundColor(.primary)

                            Text(activity.description)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }

                      
                    }
                    .padding()

                    NavigationLink("", value: activity)
                }
                .onDelete(perform: deleteActivity)
                .onMove(perform: moveActivity)
            }
            .navigationDestination(for: ActivityModel.self) { activity in
                ActivityDetailView(activity: activity, viewModel: viewModel)
            }
            .navigationTitle("Habit Tracker")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showingAddActivity = true
                    }) {
                        Label("Add", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddActivity) {
                AddActivityView(viewModel: viewModel)
            }
        }
    }

    func deleteActivity(at offsets: IndexSet) {
        viewModel.deleteActivity(at: offsets)
    }

    func moveActivity(from source: IndexSet, to destination: Int) {
        viewModel.moveActivity(from: source, to: destination)
    }
}

