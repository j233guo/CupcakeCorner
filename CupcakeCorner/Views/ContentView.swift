//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Jiaming Guo on 2022-08-21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var order = Order()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker(selection: $order.info.type, label: Text("Select your cake type")) {
                        ForEach(OrderInfo.types.indices, id: \.self) {i in
                            Text(OrderInfo.types[i])
                        }
                    }
                    Stepper("Number of cakes: \(order.info.quantity)", value: $order.info.quantity, in: 3...20)
                }
                Section {
                    Toggle("Any special requests?", isOn:
                            $order.info.specialRequestEnabled.animation())
                    if order.info.specialRequestEnabled {
                        Toggle("Add extra frosting", isOn: $order.info.extraFrosting)
                        Toggle("Add extra sprinkles", isOn: $order.info.addSprinkles)
                    }
                }
                Section {
                    NavigationLink(destination: AddressView(order: order)) {
                        Text("Delivery Details")
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
