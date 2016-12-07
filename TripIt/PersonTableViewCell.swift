//
//  PersonTableViewCell.swift
//  TripIt
//
//  Created by Adam Abdulhamid on 11/30/16.
//  Copyright © 2016 AdamAbdulhamid. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var invite: UIButton!
    @IBOutlet weak var thumbnailImage: UIImageView!
    
    
    var isTouched = false
    
    var blue = UIColor(red: 77.0/255.0, green: 184.0/255.0, blue: 255.0/255.0, alpha: 1.0)
    var green = UIColor(red: 130.0/255.0, green: 255.0/255.0, blue: 130.0/255.0, alpha: 1.0)
    
    @IBAction func changeColor(_ sender: Any) {
                
        if isTouched {
            isTouched = false
        } else {
            isTouched = true
        }
        
        if isTouched {
            
            invite.backgroundColor = green
            invite.layer.cornerRadius = 10
            invite.layer.borderWidth = 1
            invite.layer.borderColor = green.cgColor            
            
        } else {
            
            invite.backgroundColor = blue
            invite.layer.cornerRadius = 10
            invite.layer.borderWidth = 1
            invite.layer.borderColor = blue.cgColor
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
        invite.backgroundColor = blue
        invite.layer.cornerRadius = 10
        invite.layer.borderWidth = 1
        invite.layer.borderColor = blue.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        // super.setSelected(selected, animated: animated)
    }
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.characters.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

}
