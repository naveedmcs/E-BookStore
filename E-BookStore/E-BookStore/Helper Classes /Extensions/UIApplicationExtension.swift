//
//  UIApplicationExtension.swift
//  Quick Fill
//
//  Created by Muhammad  Naveed on 03/08/2020.
//  Copyright © 2020 Technerds. All rights reserved.
//

import Foundation
import UIKit

//for uikit ---------------
extension UIApplication {
     static func getAppDelegate()-> AppDelegate? {
        return UIApplication.shared.delegate as? AppDelegate
    }
    func setRootViewController(_ instance: UIViewController ) {
        if let window = UIApplication.getAppDelegate()?.window {
            window.switchRootViewController(instance)
            window.makeKeyAndVisible()
        }
       
    }
}





extension UIWindow {
    static var key: UIWindow? {
        if #available(iOS 13, *) {
            return UIApplication.shared.windows.first { $0.isKeyWindow }
        } else {
            return UIApplication.shared.keyWindow
        }
    }
    
    func switchRootViewController(_ viewController: UIViewController,  animated: Bool = true, duration: TimeInterval = 0.5, options: UIView.AnimationOptions = .transitionCrossDissolve, completion: (() -> Void)? = nil) {
        
        guard animated else {
            rootViewController = viewController
            return
        }
        
        UIView.transition(with: self, duration: duration, options: options, animations: {
            let oldState = UIView.areAnimationsEnabled
            UIView.setAnimationsEnabled(false)
            self.rootViewController = viewController
            UIView.setAnimationsEnabled(oldState)
        }) { _ in
            completion?()
        }
    }
}

//---------- NSObject to Strings --------------
extension NSObject {
    class var className: String {
        return String(describing: self)
    }
    class var toString: String {
        return String(describing: self)
    }
}

//-------------- app version ----////////////////
extension UIApplication {
    enum InfoPlist {
        static let versionNumber = "CFBundleShortVersionString"
        static let buildNumber = "CFBundleVersion"
    }
    
    static var appVersion: String {
        let versionNumber = Bundle.main.infoDictionary?[InfoPlist.versionNumber] as? String
        let buildNumber = Bundle.main.infoDictionary?[InfoPlist.buildNumber] as? String
        
        let formattedBuildNumber = buildNumber.map {
            return "(\($0))"
        }
        let version = [versionNumber,formattedBuildNumber].compactMap { $0 }.joined(separator: " ")
        return "Version \(version)"
    }
}

