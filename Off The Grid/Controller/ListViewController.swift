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
        
        tableView.register(UINib(nibName: "LocationCell", bundle: nil), forCellReuseIdentifier: "locationCell")
        
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        let backArrowImage = UIImage(named: "back-button-black")
        navigationController?.navigationBar.backIndicatorImage = backArrowImage
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = backArrowImage
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.tintColor = .black
       
        locations = locationDataManager.loadLocations()
        tableView.rowHeight = 130
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
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
            descVC.locationAddress = selectedLocation?.address ?? ""
            descVC.locationCoordinates = selectedLocation?.coordinates ?? []
        }
    }
}




//MARK: - Tableview Datasource Methods
extension ListViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "locationCell", for: indexPath) as! LocationCell
        cell.selectionStyle = .none
        
        if let item = locations?[indexPath.row] {
            cell.locationNameLabel?.text = item.name
            cell.categoryLabel?.text = item.category
        } else {
            cell.locationNameLabel?.text = ""
            cell.categoryLabel?.text = ""
        }
        
        return cell
    }
    
    
}
