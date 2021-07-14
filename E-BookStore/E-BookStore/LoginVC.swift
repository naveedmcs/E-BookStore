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
        
    }

}


//MARK:- navigation
extension LoginVC {
    func gotoAdminTabbarController() {
        let s = UIStoryboard(name: "Main", bundle: nil)
        let vc = s.instantiateViewController(withIdentifier: "AdminTabbarController") as! AdminTabbarController
        
    }
}
