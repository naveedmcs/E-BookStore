//
//  NotificationsVC.swift
//  E-BookStore
//
//  Created by Muhammad  Naveed on 24/07/2021.
//

import UIKit

class NotificationsVC: UIViewController {

    //MARK:-  outlets
    @IBOutlet weak private var tableView: UITableView?
    
    var items = [1,2,3,4,5]

    //MARK:-  view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView?.registerCell(id: NotificationTableViewCell.className)
    }


}

extension NotificationsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NotificationTableViewCell.className) as! NotificationTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let contextItem = UIContextualAction(style: .normal, title: "Delete") {  (contextualAction, view, boolValue) in
//            let notifcation = self.notificationList[indexPath.row]
//            self.requestDeleteNotification(showLoader: true, id: notifcation.id)
          
        }
        contextItem.backgroundColor = #colorLiteral(red: 0, green: 0.4901960784, blue: 0.9490196078, alpha: 1)
        contextItem.image = UIImage(systemName: "trash")
        let swipeActions = UISwipeActionsConfiguration(actions: [contextItem])

        return swipeActions
    }
    
}
