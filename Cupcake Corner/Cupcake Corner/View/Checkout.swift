//
//  Checkout.swift
//  Cupcake Corner
//
//  Created by mac on 27/10/24.
//

import SwiftUI
struct Checkout: View {
    var order: Order
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    @State private var showingOrderFailure = false
    @State private var errorMessage = ""

    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 233)
                
                Text("Your total is \(order.cost, format: .currency(code: "USD"))")
                    .font(.title)
                
                Button("Place Order") {
                    Task {
                        await placeOrder()
                    }
                }
            }
            .navigationTitle("Check out")
            .navigationBarTitleDisplayMode(.inline)
            
        }.alert("Thank you!", isPresented: $showingConfirmation) {
            Button("OK") { }
        } message: {
            Text(confirmationMessage)
        }.alert("Order Failed", isPresented: $showingOrderFailure) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(errorMessage)
        }
       
        
    }
    func placeOrder() async {
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode order")
            return
        }
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var requestUrl=URLRequest(url: url)
        requestUrl.setValue("application/json", forHTTPHeaderField: "Content-Type")
        requestUrl.httpMethod="POST"
        
        do {
            let (data, _) = try await URLSession.shared.upload(for: requestUrl, from: encoded)
            let decodedOrder = try JSONDecoder().decode(Order.self, from: data)

            confirmationMessage = "Your order for \(decodedOrder.quantity)x \(Order.types[decodedOrder.type].lowercased()) cupcakes is on its way!"
            showingConfirmation = true
        } catch {
            errorMessage = "Failed to place order. Please check your connection and try again."
                   showingOrderFailure = true
        }
    }
}
