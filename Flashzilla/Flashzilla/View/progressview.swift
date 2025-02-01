import SwiftUI

struct DottedProgressBar: View {
    let totalSteps: Int  // Total number of dots
    let completedSteps: Int  // Number of filled dots
    let strokeWidth: CGFloat
    let dotWidth: CGFloat  // Width of each dash
    let gapSize: CGFloat  // Space between dashes
    let cornerRadius: CGFloat
    let activeColor: Color
    let inactiveColor: Color
    let backgroundColor: Color  // Center fill color
    let text: String  // Center text

    var progress: CGFloat {
        min(CGFloat(completedSteps) / CGFloat(totalSteps), 1.0)
    }

    var dashPattern: [CGFloat] {
        [dotWidth, gapSize] // Defines the pattern of dashes
    }

    var body: some View {
        GeometryReader { geo in
            let totalDots = calculateTotalDots(width: geo.size.width, height: geo.size.height)
            let filledDots = calculateFilledDots(totalDots: totalDots)

            ZStack {
                // **Filled Background**
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(LinearGradient(
                        gradient: Gradient(colors: [Color.purple, Color.blue]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )).padding(3)

                // **Inactive Dots (Full Border)**
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(inactiveColor, style: StrokeStyle(lineWidth: strokeWidth, lineCap: .round, dash: dashPattern))

                // **Active Dots (Completed Progress)**
                RoundedRectangle(cornerRadius: cornerRadius)
                    .trim(from: 0, to: filledDots) // Partial progress
                    .stroke(activeColor, style: StrokeStyle(lineWidth: strokeWidth, lineCap: .round, dash: dashPattern))
                    .rotationEffect(.degrees(180)) // Align properly
                // **Text Overlay**
                // **Text Overlay**
                           HStack {
                               Text("11th Mala")
                                   .font(.headline)
                                   .foregroundColor(.white) // Change to white for better visibility
                                   .padding(.leading, 12)
                               Spacer()
                               Text(text) // Dynamic progress text
                                   .font(.headline)
                                   .foregroundColor(.white) // Change to white for better visibility
                                   .padding(.trailing, 12)
                           }
                           .padding(.horizontal, 16) // A/ A
              
            }
        }
        .frame(height: 50) // Maintain proper height
    }

    // **Calculate Total Dots Based on Perimeter**
    private func calculateTotalDots(width: CGFloat, height: CGFloat) -> Int {
        let perimeter = (width * 2) + (height * 2) - (cornerRadius * 4) * .pi
        let singleUnit = dotWidth + gapSize
        return max(1, Int(perimeter / singleUnit)) // Ensures proper dot count
    }

    // **Determine Filled Dots Based on Progress**
    private func calculateFilledDots(totalDots: Int) -> CGFloat {
        let filledCount = Int(CGFloat(totalDots) * progress)
        return CGFloat(max(0, min(totalDots, filledCount))) / CGFloat(totalDots)
    }
}
