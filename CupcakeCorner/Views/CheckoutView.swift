//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Jiaming Guo on 2022-08-23.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order: Order
    
    
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
                Text("Your total is \(order.cost, format: .currency(code: Locale.current.currencyCode ?? "USD"))")
                    .font(.title)
                Button(action: {
                    
                }, label: {
                    Text("Place Order")
                        .padding(.horizontal)
                })
                .buttonStyle(.borderedProminent)
                .padding()
            }
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
