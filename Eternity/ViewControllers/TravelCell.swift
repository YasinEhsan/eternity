//
//  TravelCell.swift
//  Eternity
//
//  Created by Helal Chowdhury on 3/17/19.
//  Copyright © 2019 Yasin Ehsan. All rights reserved.
//

import UIKit

class TravelCell: UITableViewCell {
    
    @IBOutlet weak var travelImageView: UIImageView!
    
    @IBOutlet weak var travelAmountText: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
