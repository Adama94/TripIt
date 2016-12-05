//
//  LocationSelectionViewController.swift
//  TripIt
//
//  Created by Adam Abdulhamid on 12/4/16.
//  Copyright © 2016 AdamAbdulhamid. All rights reserved.
//

import UIKit

class LocationSelectionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tripName: String?
    
    var locationToAddImageName: String?
    var locationToAddName: String?

    var locationToAddImage: UIImage? {
        didSet {
            locations.append(place(name: locationToAddName!, image: UIImage(named: locationToAddImageName!)!))
            self.tableView.reloadData()
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    struct place {
        var name: String
        var image: UIImage
    }
    
    var locations = [place(name: "Cabo, MX", image: UIImage(named: "cabo.jpg")!),
                  place(name: "Maui, HI", image: UIImage(named: "maui.jpg")!)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = tripName
    }
    
    @IBAction func done(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "LocationCell") as! LocationSelectionTableViewCell
        
        let location = locations[indexPath.row]
        
        cell.backgroundImage.image = location.image
        cell.locationName.text = location.name
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? AddDateViewController {
            destinationVC.tripName = tripName
            destinationVC.fatherViewController = self
        }
    }


}
