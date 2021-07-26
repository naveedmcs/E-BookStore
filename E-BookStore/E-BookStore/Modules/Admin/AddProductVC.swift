//
//  AddProductVC.swift
//  E-BookStore
//
//  Created by Naveed-IOS on 14/07/2021.
//

import UIKit

class AddProductVC: UIViewController {

    //MARK:- outlets
    //MARK:- let & var
    //MARK:- view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK:- actions
    @IBAction private func categoryBtnTapped(sender: UIButton) {
        let vc = UIStoryboard.get(.main).instantiateViewController(withIdentifier: CategoriesVC.className) as! CategoriesVC
        self.navigationController?.pushViewController(vc, animated: true)
    }


}
