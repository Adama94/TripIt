//
//  AddDateViewController.swift
//  TripIt
//
//  Created by Adam Abdulhamid on 12/4/16.
//  Copyright © 2016 AdamAbdulhamid. All rights reserved.
//

import UIKit

class AddDateViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UISearchDisplayDelegate {

    struct place {
        var name: String
        var image: UIImage
        var imageName: String
    }
    
    var places = [place(name: "Ometepe, NI", image: UIImage(named: "ometepe.jpg")!, imageName: "ometepe.jpg"),
                  place(name: "Hong Kong, CN", image: UIImage(named: "hong kong.jpg")!, imageName: "hong kong.jpg"),
                  place(name: "Dubrovnik, HR", image: UIImage(named: "dubrovnik.jpg")!, imageName: "dubrovnik.jpg")]

    
    var searchResults = [place]()
    
    var tripName: String?
    var fatherViewController: LocationSelectionViewController?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = tripName
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        if tableView == self.searchDisplayController!.searchResultsTableView {
            return self.searchResults.count
        } else {
            return self.places.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "AddLocationCell") as! AddLocationTableViewCell
        
        var arrayOfLocations:Array<place>?
        
        if tableView == self.searchDisplayController!.searchResultsTableView {
            arrayOfLocations = self.searchResults
        } else {
            arrayOfLocations = self.places
        }
        
        if arrayOfLocations != nil && arrayOfLocations!.count >= indexPath.row {
            let place = arrayOfLocations![indexPath.row]
            cell.backgroundImage.image = place.image
            cell.nameLabel.text = place.name
        }
        
        return cell
    }
    
    func searchDisplayController(_ controller: UISearchDisplayController, shouldReloadTableForSearch searchString: String?) -> Bool {
        self.filterContentForSearchText(searchText: searchString!)
        return true
    }
    
    func filterContentForSearchText(searchText: String) {
        self.searchResults = self.places.filter({(aPlace: place) -> Bool in
            return aPlace.name.lowercased().range(of: searchText.lowercased()) != nil
        })
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        fatherViewController?.locationToAddImageName = places[indexPath.row].imageName
        fatherViewController?.locationToAddName = places[indexPath.row].name
        fatherViewController?.locationToAddImage = places[indexPath.row].image
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
