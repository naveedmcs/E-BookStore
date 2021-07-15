//
//  LoginVC.swift
//  E-BookStore
//
//  Created by Naveed-IOS on 14/07/2021.
//

import UIKit

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

  //MARK:- actions
    @IBAction func loginBtnTapped(sender: UIButton) {
        
        gotoAdminTabbarController()
    }
    
    @IBAction func registerBtnTapped(sender: UIButton) {
        let vc = UIStoryboard.get(.main).instantiateViewController(withIdentifier: RegisterCustomerVC.className) as! RegisterCustomerVC
        self.navigationController?.pushViewController(vc, animated: true)
    }

}


//MARK:- navigation
extension LoginVC {
    func gotoAdminTabbarController() {
        print("Hello world")
        UIApplication.getSceneDelegate()?.navigateToRootControllerMainTabbar()
    }
}
