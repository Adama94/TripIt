//
//  AddLocationTableViewCell.swift
//  TripIt
//
//  Created by Adam Abdulhamid on 12/4/16.
//  Copyright © 2016 AdamAbdulhamid. All rights reserved.

import UIKit

class AddLocationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var backgroundImage: UIImageView!

    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
