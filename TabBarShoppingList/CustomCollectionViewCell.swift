//
//  CustomCollectionViewCell.swift
//  TabBarShoppingList
//
//  Created by Angel Octavio Lopez Cruz on 30/05/24.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    
    func setup(name: String) {
        productTitle.text = name
        //productImage.image = UIImage(named: "pencil")
    }
}
