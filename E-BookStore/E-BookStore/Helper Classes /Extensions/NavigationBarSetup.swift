//
//  NavigationBarSetup.swift
//  newqwwoo
//
//  Created by technerds on 17/03/2020.
//  Copyright © 2020 Tech nerds. All rights reserved.
//

import UIKit


extension UINavigationController {
    
    func backToViewController(vc: Any) {
        // iterate to find the type of vc
        for element in viewControllers as Array {
            if "\(type(of: element)).Type" == "\(type(of: vc))" {
                self.popToViewController(element, animated: true)
                break
            }
        }
    }
    
}

extension UINavigationController {
    static func setupNavigationBarAppearance(){
        
        let font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().tintColor = #colorLiteral(red: 0, green: 0.4899091721, blue: 0.9511727691, alpha: 1)
        UINavigationBar.appearance().barTintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        
        // Sets background to a blank/empty image
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        // Sets shadow (line below the bar) to a blank image
        UINavigationBar.appearance().shadowImage = UIImage()
        // Sets the translucent background color
        UINavigationBar.appearance().backgroundColor = .clear
        
        // Set translucent. (Default value is already true, so this can be removed if desired.)
        UINavigationBar.appearance().isTranslucent = true
        
        
        UINavigationBar.appearance().titleTextAttributes = [ NSAttributedString.Key.font: font , NSAttributedString.Key.foregroundColor: UIColor.white]
        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffset(horizontal: -6000, vertical: 0), for:UIBarMetrics.default)
    }
    
    static func navigationBarBlueAppearanceForVC(_ nvc: UINavigationController?) {
        guard let nvc  = nvc else {
            Logger.error(message: "navigationbar controller is nil")
            return
        }
        nvc.navigationBar.isTranslucent = false
        nvc.navigationBar.barTintColor = #colorLiteral(red: 0, green: 0.4899091721, blue: 0.9511727691, alpha: 1)
        nvc.navigationBar.tintColor = .white
    }
    
}





