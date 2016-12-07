//
//  DateSelectionViewController.swift
//  TripIt
//
//  Created by Adam Abdulhamid on 12/6/16.
//  Copyright © 2016 AdamAbdulhamid. All rights reserved.
//

import UIKit

class DateSelectionViewController: UIViewController {

    var tripName: String?
    
    @IBOutlet weak var startDate: UIDatePicker!
    @IBOutlet weak var endDate: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = tripName
    }
    
    @IBAction func done(_ sender: Any) {
        
        if let navigationController = self.navigationController as? DataHoldingNavigationViewController {
            navigationController.startDate = startDate.date
            navigationController.endDate = endDate.date
        }
        
        navigationController?.popViewController(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
