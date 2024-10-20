import SwiftUI

struct ActivityDetailView: View {
    @ObservedObject var activity: ActivityModel
    @ObservedObject var viewModel: ActivityViewModel

    @State private var isButtonDisabled = false
    @State private var showSuccessMessage = false

    var body: some View {
        VStack {
            Text(activity.description)
                .padding()

            Text("Completion Count: \(activity.completeCount)")
                .font(.headline)

            Button("Mark Completed") {
                markCompleted()
            }
            .padding()
            .background(isButtonDisabled ? Color.gray : Color.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .disabled(isButtonDisabled)

            if showSuccessMessage {
                Text("Marked as completed!")
                    .foregroundColor(.green)
                    .transition(.opacity)
            }
        }
        .navigationTitle(activity.title)
    }

    func markCompleted() {
        viewModel.completeActivity(activity)

        // Disable the button to prevent multiple taps
        isButtonDisabled = true

        // Show success message
        showSuccessMessage = true

        // Re-enable the button after 3 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            isButtonDisabled = false
            showSuccessMessage = false
        }
      
        
    }
}
