//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Jiaming Guo on 2022-08-22.
//

import SwiftUI

struct AddressView: View {
    @ObservableObject var order: Order
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order: Order())
    }
}
