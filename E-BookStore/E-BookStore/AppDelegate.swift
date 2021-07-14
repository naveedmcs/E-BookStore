//
//  AppDelegate.swift
//  E-BookStore
//
//  Created by Muhammad  Naveed on 09/07/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}



//Mark:-  private methods
extension AppDelegate {
    func loadAppDataOnDidFinishLaunch()  {
    
       
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = .white
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = true
        IQKeyboardManager.shared.previousNextDisplayMode = .alwaysShow
        navigateToRootControllerSplashVC()
        UINavigationController.setupNavigationBarAppearance()
        Logger.debug(message: "-----Environment------")
        debugPrint("current Environment :\(Environment.current.rawValue)")
        Logger.debug(message: "-----Environment------")
        
        if #available(iOS 13.0, *) {
            window?.overrideUserInterfaceStyle = .light
        }
    }
    
    func pushNotificationConfigure() {
        let manager = PushNotificationManager()
        manager.registerForPushNotifications()
    }
    
 
}

//Mark:-  root controllers
extension AppDelegate {
    
   func navigateToRootControllerSplashVC()  {
       let s = UIStoryboard.get(.main)
       let vc = s.instantiateViewController(identifier: SplashVC.className)
       self.window?.switchRootViewController(vc)
       self.window?.makeKeyAndVisible()
   }
    
    func navigateToRootControllerLoginVC()  {
        let s = UIStoryboard.get(.auth)
        let vc = s.instantiateViewController(identifier: LoginVC.className)
        let nvc = UINavigationController(rootViewController: vc)
        self.window?.rootViewController = nvc
        self.window?.makeKeyAndVisible()
    }
    
    func navigateToRootControllerMainTabbar() {
        let s = UIStoryboard.get(.main)
        let vc = s.instantiateViewController(identifier: TabbarController.className)
        self.window?.switchRootViewController(vc)
        self.window?.makeKeyAndVisible()
    }
    
}

