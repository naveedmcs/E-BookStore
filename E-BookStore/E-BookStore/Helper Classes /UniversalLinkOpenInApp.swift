//
//  UniversalLinkOpenInApp.swift
//  Quick Fill
//
//  Created by Muhammad  Naveed on 04/08/2020.
//  Copyright © 2020 Technerds. All rights reserved.
//

import Foundation
import UIKit

class URLSchemeCanOpen {
    
     func dialPhone(number:String?) {
        guard let phone = number else { return }
        
        if let phoneCallURL = URL(string: "tel://\(phone)") {
            
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL)) {
                if #available(iOS 10.0, *) {
                    application.open(phoneCallURL, options: [:], completionHandler: nil)
                } else {
                    // Fallback on earlier versions
                    application.openURL(phoneCallURL as URL)
                    
                }
            }
        }
    }
    
    
     func sendsms(number:String?) {
          guard let phone = number else { return }
        
        if let messageURL = URL(string: "sms://\(phone)") {
            
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(messageURL)) {
                if #available(iOS 10.0, *) {
                    application.open(messageURL, options: [:], completionHandler: nil)
                } else {
                    // Fallback on earlier versions
                    application.openURL(messageURL as URL)
                    
                }
            }
        }
    }
    
    func sendMail(email: String?) {
        guard let email = email else {
            print("error: Email not found")
            return
        }
        if let messageURL = URL(string: "mailto:\(email)") {
            
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(messageURL)) {
                if #available(iOS 10.0, *) {
                    application.open(messageURL, options: [:], completionHandler: nil)
                } else {
                    // Fallback on earlier versions
                    application.openURL(messageURL as URL)
                    
                }
            }
        }
    }
    
}
