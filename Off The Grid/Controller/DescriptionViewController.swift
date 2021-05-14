//
//  DescriptionViewController.swift
//  Off The Grid
//
//  Created by Thaoly Ngo on 5/4/21.
//

import UIKit

class DescriptionViewController: UIViewController{
    
    var locationName = ""
    var locationDescription = ""
    var locationAddress = ""
    var locationPhone = ""
    var featureWebsite = ""
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        nameLabel.text = locationName
    }
    
}
