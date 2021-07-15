//
//  ProductModels.swift
//  E-BookStore
//
//  Created by Naveed-IOS on 14/07/2021.
//

import Foundation

//http://demo.dream-space.web.id/markeet_panel/#/create_product
struct ProductModel {
   
    enum statusType {
        case ReadyStock
        case outOFStock
        case suspend
        
        var formattedString: String {
            switch self {
            case .ReadyStock:
                return "Ready Stock"
            case .outOFStock:
                return "Out Of Stock"
            case .suspend:
                return "Suspend"
            }
        }
    }
    
    var name: String?
    var price: Double?
    var stock: Int?
    var status: statusType?
    var category: String?
}




extension ProductModel {
    var priceFormatted: String {
        return "\(price?.round(to: 1) ?? 0) $"
    }
    
    var stockFormatted: String {
        return "\(stock ?? 0)"
    }
    
    
    static var listData : [ProductModel] {
        return [
            ProductModel(name: "Book A", price: 30, stock: 10, status: .ReadyStock, category: "A"),
            ProductModel(name: "Book B", price: 20.2, stock: 20, status: .ReadyStock, category: "B"),
            ProductModel(name: "Book C", price: 10.24, stock: 30, status: .ReadyStock, category: "C"),
            ProductModel(name: "Book D", price: 55.3434, stock: 35, status: .ReadyStock, category: "D")
        ]
    }
}
