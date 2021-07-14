//
//  AlertController.swift
//  newqwwoo
//
//  Created by technerds on 13/03/2020.
//  Copyright © 2020 Tech nerds. All rights reserved.
//

import UIKit

struct AlertController {
    
    static func showError(buttonTitle: String = "OK", title: String = "Alert", _ message: String, viewController: UIViewController, _ completion: (() -> Void)? = nil)  {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: { (action) in
            completion?()
        }))
		
		
       
        viewController.present(alert, animated: true, completion: nil)
       
        
    }
    
    static func showError(buttonTitle: String = "OK", title: String = "Alert", message: String, _ completion: (() -> Void)? = nil)  {
          
          let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
          alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: { (action) in
              completion?()
          }))
          
        let rootVC = UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.rootViewController
        rootVC?.present(alert, animated: true, completion: nil)
     
          
      }
    
    
    static func showSuccess(buttonTitle: String = "OK", title: String = "Success!", _ message: String, _ completion: (() -> Void)? = nil)  {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: { (action) in
            completion?()
        }))
        
        
       
        if let rootController = UIApplication.shared.windows.first?.rootViewController {
             rootController.present(alert, animated: true, completion: nil)
        }
       
        
    }
    
    static func confirmation(vc: UIViewController? = nil ,title: String = "Confirmation Alert", _ message: String, _ confirm: (() -> Void)? = nil)  {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        
        alert.addAction(UIAlertAction(title: "CANCEL", style: .cancel, handler: { (action) in
            print("cancel tapped")
        }))
        
        alert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: { (action) in
            confirm?()
        }))
        
        if let viewController = vc {
          viewController.present(alert, animated: true, completion: nil)
          return
        }
        if let rootController = UIApplication.shared.windows.first?.rootViewController {
            rootController.present(alert, animated: true, completion: nil)
            return
        }
        
        
    }
	
    
    static func loginConfirmation(vc: UIViewController? = nil ,title: String = "Alert", _ message: String, gotoLogin: (() -> Void)? = nil, tryAgain: (() -> Void)? = nil )  {
          
          let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
          
          
        alert.addAction(UIAlertAction(title: "Try Again", style: .destructive, handler: { (action) in
              tryAgain?()
          }))
          
          alert.addAction(UIAlertAction(title: "Go To Login Screen", style: .default, handler: { (action) in
              gotoLogin?()
          }))
          
          if let viewController = vc {
            viewController.present(alert, animated: true, completion: nil)
            return
          }
          if let rootController = UIApplication.shared.windows.first?.rootViewController {
              rootController.present(alert, animated: true, completion: nil)
              return
          }
          
          
      }
    
    static func confirmation(
        firstBtnTitle:String = "Yes",
        seconBtnTitle: String = "No",
        vc: UIViewController? = nil ,
        title: String = "Confirmation Alert!",
        message: String,
        firstBtnAction: (() -> Void)? = nil,
        secondBtnAction: (() -> Void)? = nil
        ) {
          
          let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
          
          
        alert.addAction(UIAlertAction(title: firstBtnTitle, style: .default, handler: { (action) in
              firstBtnAction?()
          }))
          
          alert.addAction(UIAlertAction(title: seconBtnTitle, style: .destructive, handler: { (action) in
              secondBtnAction?()
          }))
          
          if let viewController = vc {
            viewController.present(alert, animated: true, completion: nil)
            return
          }
          if let rootController = UIApplication.shared.windows.first?.rootViewController {
              rootController.present(alert, animated: true, completion: nil)
              return
          }
          
          
      }
    
    
//    static func present(vc: UIViewController? = nil ,
//						title: String = "Alert",
//						_ message: String,
//						_ completion: (() -> Void)? = nil)  {
//        
//		
//		let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
//		alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
//			completion?()
//		}))
//       
//        
//        if let viewController = vc {
//          viewController.present(alert, animated: true, completion: nil)
//          return
//        }
//        if let rootController = UIApplication.shared.windows.first?.rootViewController {
//            rootController.present(alert, animated: true, completion: nil)
//            return
//        }
//        
//        
//    }

}
