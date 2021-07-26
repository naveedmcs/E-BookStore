//
//  CustomersVC.swift
//  E-BookStore
//
//  Created by Naveed-IOS on 14/07/2021.
//

import UIKit

class CustomersVC: UIViewController {

    //MARK:- outelets
    @IBOutlet weak private var tableView: UITableView?
    
    //MARK:- let and var
    var customers = ["Customer A", "Customer B", "Customer C", "Customer d"]
    //MARK:- view life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Customers"
        self.tableView?.separatorStyle = .singleLine
        self.tableView?.tableFooterView = UIView()
    }
    

   
}

extension CustomersVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customers.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        let customer = customers[indexPath.row]
        cell.textLabel?.text = customer
        let userName = customer.replacingOccurrences(of: " ", with: "").lowercased()
        cell.detailTextLabel?.text = "\(userName)@example.com"
        return cell
    }
}
