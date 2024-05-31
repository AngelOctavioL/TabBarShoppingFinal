//
//  CustomTableStoreViewCell.swift
//  TabBarShoppingList
//
//  Created by Angel Octavio Lopez Cruz on 31/05/24.
//

import UIKit

class CustomTableStoreViewCell: UITableViewCell {
    @IBOutlet weak var cellTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
