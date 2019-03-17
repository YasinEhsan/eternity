//
//  FoodCell.swift
//  Eternity
//
//  Created by Kevin Chen on 3/17/2019.
//  Copyright © 2019 Yasin Ehsan. All rights reserved.
//

import UIKit

class FoodCell: UITableViewCell {
    
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var foodName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
