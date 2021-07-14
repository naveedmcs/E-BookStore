//
//  DropDownExtension.swift
//  CoffeeShop
//
//  Created by apple on 2/21/20.
//  Copyright © 2020 mytechnology. All rights reserved.
//

//import UIKit
//import DropDown
//
//
//
//struct DropDownManager {
//    var dropdown: DropDown
//
//    init() {
//        self.dropdown = DropDown()
//    }
//
//    func dataSource(_ items: [String], placeholder: String? , _ button: UIButton){
//
//
//        dropdown.semanticContentAttribute = .unspecified
//
//        dropdown.anchorView = button
//        dropdown.bottomOffset = CGPoint(x: 0, y: button.bounds.height)
//
//        var items = items
//        if let placeholder = placeholder {
//             items.insert(placeholder, at: 0)
//        }
//
//        dropdown.dataSource = items
//
//
//        dropdown.customCellConfiguration = { (index: Index, item: String, cell: DropDownCell) -> Void in
//
//            //cell.optionLabel.textAlignment = AppDefaultLanguage == .en ? .left:.right
//
//        }
//    }
//
//
//    func open()  {
//        dropdown.show()
//    }
//
//	func multipleSelectionConfig(selectedItems: [String]) {
//		dropdown.dismissMode = .automatic
//		dropdown.customCellConfiguration = { index, item, cell in
//			if selectedItems.contains(item ) == true {
//				cell.accessoryType = UITableViewCell.AccessoryType.checkmark
//			} else {
//				cell.accessoryType = UITableViewCell.AccessoryType.none
//			}
//		}
////
////		dropdown.selectionAction = { index, item in
////			if selectedItems.contains(item ?? "") {
////				weakSelf.selectedHobbies.removeAll { $0 as AnyObject === item as AnyObject }
////			} else {
////				weakSelf.selectedHobbies.append(item ?? "")
////			}
////			weakSelf.hobbiesDropDown.reloadAllComponents()
////		}
//	}
//
//
//}
