//
//  MainMenuViewController.swift
//  TripIt
//
//  Created by Adam Abdulhamid on 11/30/16.
//  Copyright © 2016 AdamAbdulhamid. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {

    @IBOutlet weak var locationButton: UIButton!
    @IBOutlet weak var datesButton: UIButton!
    @IBOutlet weak var flightsButton: UIButton!
    @IBOutlet weak var hotelsButton: UIButton!
    
    var tripName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = tripName
        
//        let locationLayer = CALayer()
//        locationLayer.frame = CGRect(x: 0, y: CGFloat(locationButton.frame.size.height), width: CGFloat(locationButton.frame.size.width)*2, height: 1)
//        
//        locationLayer.backgroundColor = UIColor.black.cgColor
//        locationButton.layer.addSublayer(locationLayer)
//        
//        let datesLayer = CALayer()
//        datesLayer.frame = CGRect(x: 0, y: CGFloat(datesButton.frame.size.height), width: CGFloat(datesButton.frame.size.width)*2, height: 1)
//        
//        datesLayer.backgroundColor = UIColor.black.cgColor
//        datesButton.layer.addSublayer(datesLayer)
//        
//        let flightsLayer = CALayer()
//        flightsLayer.frame = CGRect(x: 0, y: CGFloat(flightsButton.frame.size.height), width: CGFloat(flightsButton.frame.size.width)*2, height: 1)
//        
//        flightsLayer.backgroundColor = UIColor.black.cgColor
//        flightsButton.layer.addSublayer(flightsLayer)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        navigationItem.title = nil
        
        if let destinationVC = segue.destination as? LocationSelectionViewController {
            destinationVC.tripName = tripName
        }
        
        if let destinationVC = segue.destination as? DateSelectionViewController {
            destinationVC.tripName = tripName
        }
        
        if let destinationVC = segue.destination as? FlightsConfirmationViewController {
            destinationVC.tripName = tripName
        }
        
    }
}
