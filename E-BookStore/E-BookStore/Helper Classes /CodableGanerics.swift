//
//  CodableGanerics.swift
//  Quick Fill
//
//  Created by Naveed-IOS on 14/10/2020.
//  Copyright © 2020 Technerds. All rights reserved.
//

import Foundation
import UIKit


@propertyWrapper
struct NullEncodable<T>: Encodable where T: Encodable {
    
    var wrappedValue: T?

    init(wrappedValue: T?) {
        self.wrappedValue = wrappedValue
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch wrappedValue {
        case .some(let value): try container.encode(value)
        case .none: try container.encodeNil()
        }
    }
}



class DictionaryEncoder {

    private let encoder = JSONEncoder()

    var dateEncodingStrategy: JSONEncoder.DateEncodingStrategy {
        set { encoder.dateEncodingStrategy = newValue }
        get { return encoder.dateEncodingStrategy }
    }


    var dataEncodingStrategy: JSONEncoder.DataEncodingStrategy {
        set { encoder.dataEncodingStrategy = newValue }
        get { return encoder.dataEncodingStrategy }
    }

    var nonConformingFloatEncodingStrategy: JSONEncoder.NonConformingFloatEncodingStrategy {
        set { encoder.nonConformingFloatEncodingStrategy = newValue }
        get { return encoder.nonConformingFloatEncodingStrategy }
    }

    var keyEncodingStrategy: JSONEncoder.KeyEncodingStrategy {
        set { encoder.keyEncodingStrategy = newValue }
        get { return encoder.keyEncodingStrategy }
    }

    func encode<T>(_ value: T) throws -> [String: Any] where T : Encodable {
        let data = try encoder.encode(value)
        return try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: Any]
    }
    
    func encoded<T: Encodable >(_ value: T) -> [String: Any]? {
       
           guard let data = try? encoder.encode(value) else { return nil }
           guard let dictionary =  try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else { return nil }
           return dictionary
    }
}

class DictionaryDecoder {

    private let decoder = JSONDecoder()

    var dateDecodingStrategy: JSONDecoder.DateDecodingStrategy {
        set { decoder.dateDecodingStrategy = newValue }
        get { return decoder.dateDecodingStrategy }
    }

    var dataDecodingStrategy: JSONDecoder.DataDecodingStrategy {
        set { decoder.dataDecodingStrategy = newValue }
        get { return decoder.dataDecodingStrategy }
    }

    var nonConformingFloatDecodingStrategy: JSONDecoder.NonConformingFloatDecodingStrategy {
        set { decoder.nonConformingFloatDecodingStrategy = newValue }
        get { return decoder.nonConformingFloatDecodingStrategy }
    }

    var keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy {
        set { decoder.keyDecodingStrategy = newValue }
        get { return decoder.keyDecodingStrategy }
    }

    func decode<T>(_ type: T.Type, from dictionary: [String: Any]) throws -> T where T : Decodable {
        let data = try JSONSerialization.data(withJSONObject: dictionary, options: [])
        return try decoder.decode(type, from: data)
    }
}


extension Encodable {
    
    func printJson()  {
       
       guard let data = try? JSONEncoder().encode(self) else { return  }
        debugPrint("-------- Request Params----------")
        debugPrint(data.prettyPrintedJSONString ?? "")
        debugPrint("-------- End Request Params----------")
    
    }
}




//// model
//struct  User: Codable {
//    var name: String?
//    var age: Int?
//    var address: Address?
//}
//
//struct Address: Codable {
//    var home: String?
//    var office: String?
//}
//
//
//let addressDic: [String: Any] = ["home": "sector A, Lahore", "office": "sector B, Lahore"]
//// assume  we have a dictionary inside another
//var userDic: [String:Any] = ["name": "naveed@technerdslab.com", "age": 26, "address": addressDic]
//
// // decoding dictionary with model
//let userModel = try DictionaryDecoder().decode(User.self, from: userDic)
//debugPrint(userModel)
//
//var userObject = User()
//userObject.name = "Akram"
//userObject.age = 20
//var addressObject = Address()
//addressObject.home = "DHA Phase A, Lahore"
//addressObject.office = "DHA Phase B, Lahore"
//userObject.address = addressObject
//
//// converting model to dictionary and send to Server
//let getDictionary = try DictionaryEncoder().encode(userObject)
//debugPrint(getDictionary)
