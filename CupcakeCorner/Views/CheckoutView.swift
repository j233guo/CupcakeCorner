//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Jiaming Guo on 2022-08-23.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order: Order
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    @State private var showingErrorAlert = false
    
    func placeOrder() async {
        guard let encoded = try? JSONEncoder().encode(order.info) else {
            print("Failed to encode order")
            return
        }
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            let decodedOrder = try JSONDecoder().decode(OrderInfo.self, from: data)
            confirmationMessage = "Your order for \(decodedOrder.quantity) \(OrderInfo.types[decodedOrder.type].lowercased()) cupcakes is on its way!"
            showingConfirmation = true
        } catch {
            showingErrorAlert = true
        }
    }
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), content: { phase in
                    if let image = phase.image {
                        image.resizable().scaledToFit()
                    } else {
                        ProgressView()
                    }
                })
                .frame(height: 233)
                Text("Your total is \(order.info.cost, format: .currency(code: Locale.current.currencyCode ?? "USD"))")
                    .font(.title)
                Button(action: {
                    Task {
                        await placeOrder()
                    }
                }, label: {
                    Text("Place Order")
                        .padding(.horizontal)
                })
                .buttonStyle(.borderedProminent)
                .padding()
            }
        }
        .alert("Thank you", isPresented: $showingConfirmation) {
            Button("OK") { }
        } message: {
            Text(confirmationMessage)
        }
        .alert("Sorry", isPresented: $showingErrorAlert) {
            Button("OK") { }
        } message: {
            Text("There has been an error in placing your order. ")
        }
        .navigationTitle("Check out")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}
