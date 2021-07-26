//
//  NotificationTableViewCell.swift

//
//  Created by Muhammad  Naveed on 10/08/2020.
//  Copyright © 2020 Technerds. All rights reserved.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {
    
    @IBOutlet weak private var imageViewNotification: UIImageView!
    @IBOutlet weak private var notificationVlineView: UIView!
    @IBOutlet weak private var title: UILabel!
    @IBOutlet weak private var subtitle: UILabel!
    @IBOutlet weak private var time: UILabel!
   
    //Mark:-  
   private var notificationIsRead: Bool = false {
        didSet {
            if notificationIsRead == false {
                self.notificationVlineView.backgroundColor = #colorLiteral(red: 0, green: 0.4901960784, blue: 0.9490196078, alpha: 1)
            }
            else {
                self.notificationVlineView.backgroundColor = #colorLiteral(red: 0.7944166064, green: 0.7944353223, blue: 0.7944252491, alpha: 1)
            }
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
//    func updateCell(object: NotificationModel)  {
//        self.notificationIsRead = object.isSeen?.toBoolValue ?? false
//        self.title.text = object.type?.type
//        self.subtitle.text = object.message
//        self.time.text = object.modifiedAt
//
//    }
}
