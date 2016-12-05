//
//  LocationSelectionTableViewCell.swift
//  TripIt
//
//  Created by Adam Abdulhamid on 12/4/16.
//  Copyright © 2016 AdamAbdulhamid. All rights reserved.
//

import UIKit

class LocationSelectionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var locationName: UILabel!
    
    var isVotedFor = false
    var isDownvotedFor = false
    
    @IBOutlet weak var thumbsUpButton: UIButton!
    @IBOutlet weak var thumbsDownButton: UIButton!
    
    @IBAction func toggle(_ sender: Any) {
        if isDownvotedFor {
            isVotedFor = true
            thumbsUpButton.setImage(UIImage(named: "green-thumb.png")!, for: .normal)
            thumbsDownButton.setImage(UIImage(named: "thumbs-down.png")!, for: .normal)
            isDownvotedFor = false
            return
        }
        
        if isVotedFor {
            isVotedFor = false
            thumbsUpButton.setImage(UIImage(named: "thumbs-up.png")!, for: .normal)
        } else {
            isVotedFor = true
            thumbsUpButton.setImage(UIImage(named: "green-thumb.png")!, for: .normal)
        }
        
        
    }
    
    @IBAction func toggleThumbsDown(_ sender: Any) {
        if isVotedFor {
            isVotedFor = false
            thumbsUpButton.setImage(UIImage(named: "thumbs-up.png")!, for: .normal)
            isDownvotedFor = true
            thumbsDownButton.setImage(UIImage(named: "red-thumb.png")!, for: .normal)
            return
        }
        
        if isDownvotedFor {
            isDownvotedFor = false
            thumbsDownButton.setImage(UIImage(named: "thumbs-down.png")!, for: .normal)
            
        } else {
            isDownvotedFor = true
            thumbsDownButton.setImage(UIImage(named: "red-thumb.png")!, for: .normal)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
