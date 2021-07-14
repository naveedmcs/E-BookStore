//
//  SwiftMessages.swift
//  Quick Fill
//
//  Created by Muhammad  Naveed on 22/07/2020.
//  Copyright © 2020 Technerds. All rights reserved.
//

import Foundation
import SwiftMessages



class AlertMessage {
    
    enum layoutType {
        case cardView,tabView, statusLine, defaulT
    }
    enum ThemeType {
           case info,success, warning, error, custom
       }
    enum PresentMode {
        case top, bottom, center
    }
//    static func ShowSuccess(title: String = "Heads Up!",
//                               _ body: String,
//                               _ layout: layoutType = .cardView,
//                               _ iconType: IconStyle = .default,
//                               _ themeType: ThemeType = .success,
//                               _ dropShadow: Bool = true,
//                               _ presentMode: PresentMode = .center)   {
//        // View setup
//        
//        let view: MessageView
//        switch layout {
//        case .cardView:
//            view = MessageView.viewFromNib(layout: .cardView)
//        case .tabView:
//            view = MessageView.viewFromNib(layout: .tabView)
//        case .statusLine:
//            view = MessageView.viewFromNib(layout: .statusLine)
//        default:
//            view = try! SwiftMessages.viewFromNib()
//        }
//        
//        view.configureContent(title: title, body: body, iconImage: nil, iconText: nil, buttonImage: nil, buttonTitle: nil, buttonTapHandler: { _ in SwiftMessages.hide()
//            
//        })
//        
//        let iconStyle: IconStyle = iconType
//       
//        
//        switch themeType {
//        case .info:
//            view.configureTheme(.info, iconStyle: iconStyle)
//            view.accessibilityPrefix = "info"
//        case .success:
//            view.configureTheme(.success, iconStyle: iconStyle)
//            view.accessibilityPrefix = "success"
//        case .warning:
//            view.configureTheme(.warning, iconStyle: iconStyle)
//            view.accessibilityPrefix = "warning"
//        case .error:
//            view.configureTheme(.error, iconStyle: iconStyle)
//            view.accessibilityPrefix = "error"
//        default:
//            let iconText = ["🐸", "🐷", "🐬", "🐠", "🐍", "🐹", "🐼"].randomElement()
//            view.configureTheme(backgroundColor: UIColor.purple, foregroundColor: UIColor.white, iconImage: nil, iconText: iconText)
//            view.button?.setImage(Icon.errorSubtle.image, for: .normal)
//            view.button?.setTitle(nil, for: .normal)
//            view.button?.backgroundColor = UIColor.clear
//            view.button?.tintColor = UIColor.green.withAlphaComponent(0.7)
//        }
//        
//        if dropShadow {
//            view.configureDropShadow()
//        }
//        
////        if !showButton.isOn {
////            view.button?.isHidden = true
////        }
////
////        if !showIcon.isOn {
////            view.iconImageView?.isHidden = true
////            view.iconLabel?.isHidden = true
////        }
//        
////        if !showTitle.isOn {
////            view.titleLabel?.isHidden = true
////        }
////
////        if !showBody.isOn {
////            view.bodyLabel?.isHidden = true
////        }
//        
//        // Config setup
//        
//        var config = SwiftMessages.defaultConfig
//
//        switch presentMode {
//        case .bottom:
//            config.presentationStyle = .bottom
//        case .center:
//            config.presentationStyle = .center
//        default:
//            break
//        }
//        
////        switch presentationContext.selectedSegmentIndex {
////        case 1:
////            config.presentationContext = .window(windowLevel: UIWindow.Level.normal)
////        case 2:
////            config.presentationContext = .window(windowLevel: UIWindow.Level.statusBar)
////        default:
////            break
////        }
//        
////        switch duration.selectedSegmentIndex {
////        case 1:
////            config.duration = .forever
////        case 2:
////            config.duration = .seconds(seconds: 1)
////        case 3:
////            config.duration = .seconds(seconds: 5)
////        default:
////            break
////        }
//        
////        switch dimMode.selectedSegmentIndex {
////        case 1:
////            config.dimMode = .gray(interactive: true)
////        case 2:
////            config.dimMode = .color(color: #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 0.7477525685), interactive: true)
////        case 3:
////            config.dimMode = .blur(style: .dark, alpha: 1.0, interactive: true)
////        default:
////            break
////        }
//        
//      //  config.shouldAutorotate = self.autoRotate.isOn
//        
//    //    config.interactiveHide = interactiveHide.isOn
//        
//        // Set status bar style unless using card view (since it doesn't
//        // go behind the status bar).
////        if case .top = config.presentationStyle, layout.selectedSegmentIndex != 1 {
////            switch theme.selectedSegmentIndex {
////            case 1...4:
////                config.preferredStatusBarStyle = .lightContent
////            default:
////                break
////            }
////        }
//        
//        // Show
//        SwiftMessages.show(config: config, view: view)
//    }
    
    static func showError(title: String = "Heads Up!",
                                   _ body: String,
                                   _ layout: layoutType = .cardView,
                                   _ buttonTitle: String = "Hide",
                                   _ iconType: IconStyle = .default,
                                   _ themeType: ThemeType = .error,
                                   _ dropShadow: Bool = true,
                                   _ presentMode: PresentMode = .top)   {
            // View setup
            
            let view: MessageView
            switch layout {
            case .cardView:
                view = MessageView.viewFromNib(layout: .cardView)
            case .tabView:
                view = MessageView.viewFromNib(layout: .tabView)
            case .statusLine:
                view = MessageView.viewFromNib(layout: .statusLine)
            default:
                view = try! SwiftMessages.viewFromNib()
            }
            
            view.configureContent(title: title, body: body, iconImage: nil, iconText: nil, buttonImage: nil, buttonTitle: buttonTitle, buttonTapHandler: { _ in SwiftMessages.hide() })
            
            let iconStyle: IconStyle = iconType
           
            
            switch themeType {
            case .info:
                view.configureTheme(.info, iconStyle: iconStyle)
                view.accessibilityPrefix = "info"
            case .success:
                view.configureTheme(.success, iconStyle: iconStyle)
                view.accessibilityPrefix = "success"
            case .warning:
                view.configureTheme(.warning, iconStyle: iconStyle)
                view.accessibilityPrefix = "warning"
            case .error:
                view.configureTheme(.error, iconStyle: iconStyle)
                view.accessibilityPrefix = "error"
            default:
                let iconText = ["🐸", "🐷", "🐬", "🐠", "🐍", "🐹", "🐼"].randomElement()
                view.configureTheme(backgroundColor: UIColor.purple, foregroundColor: UIColor.white, iconImage: nil, iconText: iconText)
                view.button?.setImage(Icon.errorSubtle.image, for: .normal)
                view.button?.setTitle(nil, for: .normal)
                view.button?.backgroundColor = UIColor.clear
                view.button?.tintColor = UIColor.green.withAlphaComponent(0.7)
            }
            
            if dropShadow {
                view.configureDropShadow()
            }
            
        view.button?.isHidden = true
    //        if !showButton.isOn {
    //            view.button?.isHidden = true
    //        }
    //
    //        if !showIcon.isOn {
    //            view.iconImageView?.isHidden = true
    //            view.iconLabel?.isHidden = true
    //        }
            
    //        if !showTitle.isOn {
    //            view.titleLabel?.isHidden = true
    //        }
    //
    //        if !showBody.isOn {
    //            view.bodyLabel?.isHidden = true
    //        }
            
            // Config setup
            
            var config = SwiftMessages.defaultConfig

            switch presentMode {
            case .bottom:
                config.presentationStyle = .bottom
            case .center:
                config.presentationStyle = .center
            default:
                break
            }
        
        config.presentationContext = .window(windowLevel: .normal)
            
    //        switch presentationContext.selectedSegmentIndex {
    //        case 1:
    //            config.presentationContext = .window(windowLevel: UIWindow.Level.normal)
    //        case 2:
    //            config.presentationContext = .window(windowLevel: UIWindow.Level.statusBar)
    //        default:
    //            break
    //        }
            
    //        switch duration.selectedSegmentIndex {
    //        case 1:
    //            config.duration = .forever
    //        case 2:
    //            config.duration = .seconds(seconds: 1)
    //        case 3:
    //            config.duration = .seconds(seconds: 5)
    //        default:
    //            break
    //        }
            
    //        switch dimMode.selectedSegmentIndex {
    //        case 1:
    //            config.dimMode = .gray(interactive: true)
    //        case 2:
    //            config.dimMode = .color(color: #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 0.7477525685), interactive: true)
    //        case 3:
    //            config.dimMode = .blur(style: .dark, alpha: 1.0, interactive: true)
    //        default:
    //            break
    //        }
            
          //  config.shouldAutorotate = self.autoRotate.isOn
            
        //    config.interactiveHide = interactiveHide.isOn
            
            // Set status bar style unless using card view (since it doesn't
            // go behind the status bar).
    //        if case .top = config.presentationStyle, layout.selectedSegmentIndex != 1 {
    //            switch theme.selectedSegmentIndex {
    //            case 1...4:
    //                config.preferredStatusBarStyle = .lightContent
    //            default:
    //                break
    //            }
    //        }
            
            // Show
            SwiftMessages.show(config: config, view: view)
        }
    
    
   
    
    class func showSuccess(title: String = "Success", body: String, _ completion: (() -> Void)? = nil){
           print(body)
           
           let view: MessageView
           view = MessageView.viewFromNib(layout: .centeredView)
           view.configureTheme(.success)
           view.button?.isHidden = true
           
           var config = SwiftMessages.Config()
           view.configureContent(title: title, body: body)
           config.presentationStyle = .center
           config.presentationContext = .window(windowLevel: .statusBar)
           config.dimMode = .gray(interactive: true)
           // Disable the default auto-hiding behavior.
           config.duration = .seconds(seconds: 3)
           // Dim the background like a popover view. Hide when the background is tapped.
           // config.dimMode = .gray(interactive: true)
           // Disable the interactive pan-to-hide gesture.
           // config.interactiveHide = false
           
           // Specify a status bar style to if the message is displayed
           //directly under the status bar.
           config.preferredStatusBarStyle = .lightContent
           
           // Specify one or more event listeners to respond to show and hide events.
           config.eventListeners.append() { event in
               if case .didHide = event { completion?() }
           }
           
           SwiftMessages.show(config: config, view: view)
       }
    
    class func showInfo(title: String = "", body: String, _ completion: (() -> Void)? = nil){
           print(body)
           let view: MessageView
           view = MessageView.viewFromNib(layout: .centeredView)
           view.configureTheme(.success)
           view.button?.isHidden = true
           
           var config = SwiftMessages.Config()
           view.configureContent(title: title, body: body)
           config.presentationStyle = .bottom
           config.presentationContext = .window(windowLevel: .normal)
          // config.dimMode = .gray(interactive: true)
           // Disable the default auto-hiding behavior.
           config.duration = .seconds(seconds: 3)
           // Dim the background like a popover view. Hide when the background is tapped.
           // config.dimMode = .gray(interactive: true)
           // Disable the interactive pan-to-hide gesture.
           // config.interactiveHide = false
           
           // Specify a status bar style to if the message is displayed
           //directly under the status bar.
           config.preferredStatusBarStyle = .lightContent
           
           // Specify one or more event listeners to respond to show and hide events.
           config.eventListeners.append() { event in
               if case .didHide = event { completion?() }
           }
           
           SwiftMessages.show(config: config, view: view)
       }
}
