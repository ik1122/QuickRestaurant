//
//  RestaurantsTableViewCell.swift
//  QuickDrinksApp
//
//  Created by Matthew Shimazu on 12/2/17.
//  Copyright © 2017 CS117. All rights reserved.
//

import UIKit

class RestaurantsTableViewCell: UITableViewCell {

    @IBOutlet weak var cell: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
