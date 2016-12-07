//
//  SearchViewController.swift
//  TripIt
//
//  Created by Adam Abdulhamid on 11/30/16.
//  Copyright © 2016 AdamAbdulhamid. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UISearchDisplayDelegate {

    @IBOutlet weak var tableView: UITableView!
    var searchResults = [person]()
    
    struct person {
        var name: String
        var hasBeenInvited: Bool
        var image: UIImage
    }
    
    var tripName: String? 
    
    var people = [person(name: "Adam Abdulhamid", hasBeenInvited: false, image: UIImage(named: "adam.jpg")!),
                  person(name: "BJ Churnside", hasBeenInvited: false, image: UIImage(named: "bj.jpg")!),
                  person(name: "Eric Peter", hasBeenInvited: false, image: UIImage(named: "eric.jpg")!),
                  person(name: "Erica Abrams", hasBeenInvited: false, image: UIImage(named: "erica.jpg")!),
                  person(name: "Nicole Davis", hasBeenInvited: false, image: UIImage(named: "nicole.jpg")!),
                  person(name: "Ryan Harber", hasBeenInvited: false, image: UIImage(named: "ryan.jpg")!),
                  person(name: "Seth Hildick-Smith", hasBeenInvited: false, image: UIImage(named: "seth.jpg")!),
                  person(name: "Tina Wong", hasBeenInvited: false, image: UIImage(named: "tina.jpg")!)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "Search for friends!"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.searchDisplayController!.searchResultsTableView {
            return self.searchResults.count
        } else {
            return self.people.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = self.tableView.dequeueReusableCell(withIdentifier: "ContactCell") as! PersonTableViewCell
        
        var arrayOfPeople:Array<person>?
        
        if tableView == self.searchDisplayController!.searchResultsTableView {
            arrayOfPeople = self.searchResults
        } else {
            arrayOfPeople = self.people
        }
        
        if arrayOfPeople != nil && arrayOfPeople!.count >= indexPath.row {
            let person = arrayOfPeople![indexPath.row]
            cell.name.text = person.name
            cell.thumbnailImage.layer.cornerRadius = cell.thumbnailImage.frame.size.width / 2.0
            cell.thumbnailImage.layer.masksToBounds = true
            cell.thumbnailImage!.image = person.image
            
        }
        
        
        return cell
    }
    
    func searchDisplayController(_ controller: UISearchDisplayController, shouldReloadTableForSearch searchString: String?) -> Bool {
        self.filterContentForSearchText(searchText: searchString!)
        return true
    }
    
    func filterContentForSearchText(searchText: String) {
        self.searchResults = self.people.filter({(aPerson: person) -> Bool in
            return aPerson.name.lowercased().range(of: searchText.lowercased()) != nil
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        navigationItem.title = nil
        
        if let destinationVC = segue.destination as? MainMenuViewController {
            destinationVC.tripName = tripName
        }
    }
}
