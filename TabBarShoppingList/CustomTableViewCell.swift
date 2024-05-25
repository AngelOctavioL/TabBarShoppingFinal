//
//  CustomTableViewCell.swift
//  TabBarShoppingList
//
//  Created by Diplomado on 25/05/24.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var cellTextLabel: UILabel!
    @IBOutlet weak var cellImagen: UIImageView!
    @IBOutlet weak var cellButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
