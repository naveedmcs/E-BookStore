//
//  RegisterCustomerVC.swift
//  E-BookStore
//
//  Created by Naveed-IOS on 14/07/2021.
//

import UIKit

class RegisterCustomerVC: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // self.navigationController?.navigationBar.isHidden = true
        self.navigationItem.title = "Register"
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }

    
    
    
    @IBAction private func registerBtnTapped(sender: UIButton) {
        
    }
    
    @IBAction private func loginBtnTapped(sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    


}
