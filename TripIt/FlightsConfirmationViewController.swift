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
    
    @IBAction func confirm(_ sender: Any) {
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
