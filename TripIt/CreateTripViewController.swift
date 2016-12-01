//
//  CreateTripViewController.swift
//  TripIt
//
//  Created by Adam Abdulhamid on 11/29/16.
//  Copyright © 2016 AdamAbdulhamid. All rights reserved.
//

import UIKit

class CreateTripViewController: UIViewController {

    @IBOutlet weak var CreateTripButton: UIButton!
    @IBOutlet weak var tripNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "Create Trip!"
            
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        navigationItem.title = nil
        if let destinationVC = segue.destination as? SearchViewController {
            destinationVC.tripName = tripNameTextField.text
        }
    }
}
