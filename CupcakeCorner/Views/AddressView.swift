//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Jiaming Guo on 2022-08-22.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order: Order
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.info.name)
                TextField("Street Address", text: $order.info.streetAddress)
                TextField("City", text: $order.info.city)
                TextField("Postal Code", text: $order.info.postal)
            }
            
            Section {
                NavigationLink {
                    CheckoutView(order: order)
                } label: {
                    Text("Check Out")
                }
                .disabled(!order.info.hasValidAddress)
            }
        }
        .navigationTitle("Delivery Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order: Order())
    }
}
