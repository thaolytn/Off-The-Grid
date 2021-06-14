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
        
        let backArrowImage = UIImage(named: "back-button-white")
        navigationController?.navigationBar.backIndicatorImage = backArrowImage
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = backArrowImage
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.tintColor = .black
        
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        nameLabel.text = locationName
    }
    
}
