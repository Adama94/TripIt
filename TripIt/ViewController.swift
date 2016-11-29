//
//  ViewController.swift
//  TripIt
//
//  Created by Adam Abdulhamid on 11/9/16.
//  Copyright © 2016 AdamAbdulhamid. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var LoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Lobster1.3", size: 22)!]
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "Welcome to TripIt!"
        
//        LoginButton.layer.borderWidth = 1
//        LoginButton.layer.cornerRadius = 5
//        LoginButton.layer.borderColor = UIColor.black.cgColor
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        navigationItem.title = nil
    }
}

