//
//  DescriptionViewController.swift
//  Off The Grid
//
//  Created by Thaoly Ngo on 5/4/21.
//

import UIKit

class DescriptionViewController: UIViewController{
    
    var featureName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
    
        let nameLabel = UILabel()
        nameLabel.text = featureName
        nameLabel.frame = CGRect(x: 100, y: 100, width: 300, height: 50)
        view.addSubview(nameLabel)
        
    }
    
}
