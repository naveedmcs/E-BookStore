//
//  CategoriesVC.swift
//  E-BookStore
//
//  Created by Naveed-IOS on 13/07/2021.
//

import UIKit

class CategoriesVC: UIViewController {

    //MARK:- outelets
    @IBOutlet weak private var tableView: UITableView?
    
    //MARK:- let and var
    var categories = ["a", "b", "c", "d"]
    //MARK:- view life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Categorie"
        // Do any additional setup after loading the view.
    }
    

    //MARK:- actions
    @IBAction private func addBarBtnTapped() {
        openAlertControllerTextField()
    }

    
    private func openAlertControllerTextField() {
        let alertController = UIAlertController(title: "Add New Category", message: "", preferredStyle: UIAlertController.Style.alert)
       
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter Title"
        }
        
        let saveAction = UIAlertAction(title: "Save", style: UIAlertAction.Style.default, handler: { alert -> Void in
            if let textField = alertController.textFields?.first {
                if textField.text?.trim.count ?? 0 > 0 {
                    self.addNewCategory(textField.text!)
                }
               
            }
           
        })
       
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {
            (action : UIAlertAction!) -> Void in })
    
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    private func addNewCategory(_ value: String)  {
        if let duplicate = categories.first(where: {$0.lowercased() == value.lowercased()}) {
            Logger.error(message: "Value is duplicated - not appended")
        }
        else {
            self.categories.append(value)
        }
    }
}

extension CategoriesVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = categories[indexPath.row]
        return cell
    }
}
