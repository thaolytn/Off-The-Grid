//
//  ListViewController.swift
//  Off The Grid
//
//  Created by Thaoly Ngo on 5/7/21.
//

import UIKit

class ListViewController : UITableViewController {
    
    var locations : [Location]?
    var locationDataManager = LocationDataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locations = locationDataManager.loadLocations()
        tableView.rowHeight = 100
        tableView.reloadData()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    
    //MARK: - Segue Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToDescriptionFromList", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let row = tableView.indexPathForSelectedRow?.row {
            let selectedLocation = locations?[row]
            let descVC = segue.destination as! DescriptionViewController
            descVC.locationName = selectedLocation?.name ?? ""
        }
    }
}




//MARK: - Tableview Datasource Methods
extension ListViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LocationCell", for: indexPath)
        
        if let item = locations?[indexPath.row] {
            cell.textLabel?.text = item.name
        } else {
            cell.textLabel?.text = ""
        }
        
        return cell
    }
    
    
}
