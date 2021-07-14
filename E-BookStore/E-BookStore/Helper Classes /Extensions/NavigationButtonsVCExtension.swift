//
//  NavigationButtonsVCExtension.swift
//  Quick Fill
//
//  Created by Naveed-IOS on 01/09/2020.
//  Copyright © 2020 Technerds. All rights reserved.
//

import Foundation
import UIKit


extension UIViewController {
    
    //MARK:- add button
    func navigationBarAddBtnTitle(title: String = "Add") {
        let button1 = UIBarButtonItem(title: title, style: .plain, target: self, action: #selector(addNavigationButtonTapped))
        let navitem = UINavigationItem()
        navitem.rightBarButtonItem = button1
      //  self.navigationController?.navigationItem.rightBarButtonItems = [button1]
        self.navigationController?.navigationBar.setItems([navitem], animated: true)
    }
    func navigationBarAddBtnImage() {
        self.navigationController?.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus.circle.fill"), style: .plain, target: self, action: #selector(addNavigationButtonTapped) )
    }
    
    @objc func addNavigationButtonTapped()  {
       print("override this button action \(#function) in your class ")
    }
    
    //MARK:- back button
    func setbackButtonNavigationBar(vc: UIViewController) {
       let image = UIImage(systemName: "chevron.left", withConfiguration: UIImage.SymbolConfiguration(weight: .medium))
      
       let backBtn = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(backButtonTappedNavigationBar) )
        vc.navigationItem.setLeftBarButton(backBtn, animated: true)
    }
    
   
    
    @objc func backButtonTappedNavigationBar()  {
       print("override this button action \(#function) in your class ")
    }
    
}

