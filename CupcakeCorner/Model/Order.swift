//
//  Order.swift
//  CupcakeCorner
//
//  Created by Jiaming Guo on 2022-08-22.
//

import Foundation

struct OrderInfo: Codable {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    var type = 0
    var quantity = 3
    var specialRequestEnabled = false {
        didSet {
            if !specialRequestEnabled {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    var extraFrosting = false
    var addSprinkles = false
    var name = ""
    var streetAddress = ""
    var city = ""
    var postal = ""
    
    var hasValidAddress: Bool {
        func empty(_ string : String) -> Bool {
            return string.isEmpty || string.trimmingCharacters(in: .whitespaces).isEmpty
        }

        if empty(name) || empty(streetAddress) || empty(city) || empty(postal) {
            return false
        }
        return true
    }
    
    var cost: Double {
        var cost = Double(quantity) * 2
        cost += (Double(type) / 2)
        if extraFrosting {
            cost += Double(quantity) * 1
        }
        if addSprinkles {
            cost += Double(quantity) * 0.5
        }
        return cost
    }
}

class Order: ObservableObject {
    @Published var info = OrderInfo()
//    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
//    @Published var type = 0
//    @Published var quantity = 3
//    @Published var specialRequestEnabled = false {
//        didSet {
//            if !specialRequestEnabled {
//                extraFrosting = false
//                addSprinkles = false
//            }
//        }
//    }
//    @Published var extraFrosting = false
//    @Published var addSprinkles = false
//    @Published var name = ""
//    @Published var streetAddress = ""
//    @Published var city = ""
//    @Published var postal = ""
//
//    var hasValidAddress: Bool {
//        func empty(_ string : String) -> Bool {
//            return string.isEmpty || string.trimmingCharacters(in: .whitespaces).isEmpty
//        }
//
//        if empty(name) || empty(streetAddress) || empty(city) || empty(postal) {
//            return false
//        }
//        return true
//    }
//
//    var cost: Double {
//        var cost = Double(quantity) * 2
//        cost += (Double(type) / 2)
//        if extraFrosting {
//            cost += Double(quantity) * 1
//        }
//        if addSprinkles {
//            cost += Double(quantity) * 0.5
//        }
//        return cost
//    }
//
//    enum CodingKeys: CodingKey {
//        case type, quantity, extraFrosting, addSprinkles, name, streetAddress, city, postal
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(type, forKey: CodingKeys.type)
//        try container.encode(quantity, forKey: .quantity)
//        try container.encode(extraFrosting, forKey: .extraFrosting)
//        try container.encode(addSprinkles, forKey: .addSprinkles)
//        try container.encode(name, forKey: .name)
//        try container.encode(streetAddress, forKey: .streetAddress)
//        try container.encode(city, forKey: .city)
//        try container.encode(postal, forKey: .postal)
//    }
//
//    required init(from decoder: Decoder) throws {
//        let container  = try decoder.container(keyedBy: CodingKeys.self)
//        type = try container.decode(Int.self, forKey: .type)
//        quantity = try container.decode(Int.self, forKey: .quantity)
//        extraFrosting = try container.decode(Bool.self, forKey: .extraFrosting)
//        addSprinkles = try container.decode(Bool.self, forKey: .addSprinkles)
//        name = try container.decode(String.self, forKey: .name)
//        streetAddress = try container.decode(String.self, forKey: .streetAddress)
//        city = try container.decode(String.self, forKey: .city)
//        postal = try container.decode(String.self, forKey: .postal)
//    }
//
//    init() {}
}
