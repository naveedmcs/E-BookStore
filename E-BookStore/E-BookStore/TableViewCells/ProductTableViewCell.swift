//
//  ProductTableViewCell.swift
//  E-BookStore
//
//  Created by Naveed-IOS on 14/07/2021.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    //MARK:- outlets
    @IBOutlet weak private var name: UILabel?
    @IBOutlet weak private var price: UILabel?
    @IBOutlet weak private var stock: UILabel?
    @IBOutlet weak private var status: UILabel?
    @IBOutlet weak private var imageProduct: UIImageView?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

   
    func updateCell(object: ProductModel)  {
        self.name?.text = object.name
        self.price?.text = object.priceFormatted
        self.status?.text = object.status?.formattedString
        self.stock?.text = object.stockFormatted
    }
    
}
