//
//  Order.swift
//  CupcakeCorner
//
//  Created by Jiaming Guo on 2022-08-22.
//

import Foundation

class Order: ObservableObject {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    @Published var type = 0
    @Published var quantity = 3
    @Published var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    @Published var extraFrosting = false
    @Published var addSprinkles = false
    @Published var name = ""
    @Published var streetAddress = ""
    @Published var city = ""
    @Published var postal = ""
    
    var hasValidAddress: Bool {
        if name.isEmpty || streetAddress.isEmpty || streetAddress.isEmpty || postal.isEmpty {
            return false
        }
        return true
    }
}
