//
//  FlightsConfirmationViewController.swift
//  TripIt
//
//  Created by Adam Abdulhamid on 12/6/16.
//  Copyright © 2016 AdamAbdulhamid. All rights reserved.
//

import UIKit

class FlightsConfirmationViewController: UIViewController {

    var tripName: String?
    
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        if let navigationController = self.navigationController as? DataHoldingNavigationViewController {
            self.startDateLabel.text = convertDateToString(date: navigationController.startDate!, isAfter: true)
            self.endDateLabel.text = convertDateToString(date: navigationController.endDate!, isAfter: false)
        }
    }
    
    func convertDateToString(date: Date, isAfter: Bool) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        
        let actualDate = formatter.string(from: date)
        formatter.dateStyle = .none
        
        formatter.timeStyle = .short
        
        let time = formatter.string(from: date)
        
        if isAfter {
            return "Departing:\n" + actualDate + " after " + time
        } else {
            return "Returning:\n" + actualDate + " before " + time
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = tripName
    }
    
    @IBAction func confirm(_ sender: Any) {
        
        let alert = UIAlertController(title: "Group Confirmation", message: "Thanks for confirming your information. Once everyone in the group confirms you'll get a notification to finish and purchase the flights we've selected for you! Have a great trip!", preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: {(UIAlertAction) -> Void in
        
            self.navigationController?.popViewController(animated: true)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }


//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        
//    }


}
