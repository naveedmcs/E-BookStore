//
//  CartVC.swift
//  E-BookStore
//
//  Created by Muhammad  Naveed on 24/07/2021.
//

import UIKit

class CartVC: UIViewController {

    @IBOutlet weak private var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Cart"
        self.tableView?.registerCell(id: CartTableViewCell.className)
        
    }
    

}


extension CartVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CartTableViewCell.className) as! CartTableViewCell
        
        return cell
    }
    
    
}
