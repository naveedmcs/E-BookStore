//
//  LoginVC.swift
//  E-BookStore
//
//  Created by Naveed-IOS on 14/07/2021.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak private var email: UITextField?
    @IBOutlet weak private var password: UITextField?
    
    //static
    let adminEmailValue = "admin@esolutions.com"
    let passwordValue = "admin"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        if Environment.User.current == .admin {
            self.email?.text = adminEmailValue
            self.password?.text = passwordValue
        }
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }

  //MARK:- actions
    @IBAction func loginBtnTapped(sender: UIButton) {
        if formIsvalid() == false { return }
        
        
        gotoAdminTabbarController()
    }
    
    @IBAction func registerBtnTapped(sender: UIButton) {
        let vc = UIStoryboard.get(.main).instantiateViewController(withIdentifier: RegisterCustomerVC.className) as! RegisterCustomerVC
        self.navigationController?.pushViewController(vc, animated: true)
    }

    
    //MARK:-  form validation
    private func formIsvalid() -> Bool {
        if email?.text?.trim.isEmpty ?? true {
            AlertController.showError(message: "Email is required")
            return false
        }
        
        if !(email?.text?.trim.isValidEmail == true) {
            AlertController.showError(message: "Valid email is required")
            return false
        }
        
        if password?.text?.isEmpty ?? true {
            AlertController.showError(message: "Password field is required")
            return false
        }
        
        return true
    }
    
    private func loginRequest(email: String , password: String) {
       
        if email == adminEmailValue && password == passwordValue {
           
            self.gotoAdminTabbarController()
        }
        else {
            self.gotoCustomerTabbarController()
        }
    }
}


//MARK:- navigation
extension LoginVC {
    func gotoAdminTabbarController() {
        Environment.User.current = .admin
        UIApplication.getSceneDelegate()?.navigateToRootControllerMainTabbar()
    }
    func gotoCustomerTabbarController() {
        Environment.User.current = .customer
        UIApplication.getSceneDelegate()?.navigateToRootControllerMainTabbar()
    }
}
