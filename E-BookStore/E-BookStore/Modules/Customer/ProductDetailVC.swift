//
//  ProductDetailVC.swift
//  E-BookStore
//
//  Created by Naveed-IOS on 14/07/2021.
//

import UIKit

class ProductDetailVC: UIViewController {
    
    @IBOutlet weak private var cartBtn: UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        
      
    }
    
    private func renderView(userType: Environment.User) {
        cartBtn?.isHidden = userType == .admin ? true:false
    }


}
