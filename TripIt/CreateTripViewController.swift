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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "Create Trip!"
        
//        CreateTripButton.layer.borderWidth = 1
//        CreateTripButton.layer.cornerRadius = 5
//        CreateTripButton.layer.borderColor = UIColor.black.cgColor
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        navigationItem.title = nil
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
