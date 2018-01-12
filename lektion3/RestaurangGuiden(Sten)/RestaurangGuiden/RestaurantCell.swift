//
//  RestaurantCell.swift
//  RestaurangGuiden
//
//  Created by Sten R Kaiser on 2018-01-10.
//  Copyright © 2018 Kaiser&Kaiser. All rights reserved.
//

import UIKit

class RestaurantCell: UITableViewCell {
    @IBOutlet weak var restName: UILabel!
    @IBOutlet weak var restImg: UIImageView!
    @IBOutlet weak var restAdress: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        restImg.layer.cornerRadius = 20
        restImg.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
