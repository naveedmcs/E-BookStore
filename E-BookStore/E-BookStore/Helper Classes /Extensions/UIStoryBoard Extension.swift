//
//  UIStoryBoard Extension.swift
//  Quick Fill
//
//  Created by Muhammad  Naveed on 28/07/2020.
//  Copyright © 2020 Technerds. All rights reserved.
//

import Foundation
import UIKit


extension UIStoryboard {
    
    enum StoryBoardType: String {
        case main = "Main"
        
        
    }
    class func get(_ type: StoryBoardType) -> UIStoryboard {
           return UIStoryboard(name: type.rawValue, bundle: nil)
    }

    
    
}
