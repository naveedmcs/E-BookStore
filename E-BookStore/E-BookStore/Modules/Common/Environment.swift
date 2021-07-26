//
//  Environment.swift
//  E-BookStore
//
//  Created by Muhammad  Naveed on 19/07/2021.
//

import Foundation

enum Environment {
    enum User {
        case admin
        case customer
        static var current: Environment.User  = .admin
        }
}
