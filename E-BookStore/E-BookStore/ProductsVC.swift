//
//  ProductsVC.swift
//  E-BookStore
//
//  Created by Naveed-IOS on 13/07/2021.
//

import UIKit

class ProductsVC: UIViewController {

    //MARK:- outlets
    @IBOutlet weak private var tableView: UITableView?
    
    //MARK:- let & var
   
    private var products = [ProductModel]()
    

    
    //MARK:- view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Products"
        self.navigationController?.navigationBar.isHidden = false
        self.setupTableView()
     
    }
    
//MARK:- private methods
   private func setupTableView()  {
        self.tableView?.registerCell(id: ProductTableViewCell.className)
        self.products = ProductModel.listData
        self.tableView?.reloadData()
    }
    
    //MARK:- actions
    @IBAction private func addBtnTapped(sender: UIButton) {
        let vc = UIStoryboard.get(.main).instantiateViewController(withIdentifier: AddProductVC.className) as! AddProductVC
        self.navigationController?.pushViewController( vc, animated: true)
    }
}

//MARK:- tableview Data source
extension ProductsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.products.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.className) as! ProductTableViewCell
        cell.updateCell(object: products[indexPath.row])
        return cell
    }
}


//MARK:- tableview Delegate
extension ProductsVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard.get(.main).instantiateViewController(identifier: ProductDetailVC.className) as! ProductDetailVC
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}

