//
//  DescriptionViewController.swift
//  Off The Grid
//
//  Created by Thaoly Ngo on 5/4/21.
//

import UIKit

class DescriptionViewController: UIViewController{
    
    var locationName : String = ""
    var locationDescription : String = ""
    var locationAddress : String = ""
    var locationCoordinates : [Float] = []
    
    @IBOutlet weak var takeMeButton: UIButton!
    @IBOutlet weak var locationNameLabel: UILabel!
    @IBOutlet weak var locationAddressLabel: UILabel!
    
    
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
        
        locationNameLabel.text = locationName
        locationAddressLabel.text = locationAddress
        
        takeMeButton.addTarget(self, action: #selector(handleTakeMeButtonTap), for: .touchUpInside)
    }
    
    
    @objc @IBAction func handleTakeMeButtonTap(sender: UIButton!) {
  
        guard let url = URL(string:"comgooglemaps://") else { return }
        
        if UIApplication.shared.canOpenURL(url) {
            let name = locationName.replacingOccurrences(of: " ", with: "+")
            
            guard let fullURL = URL(string: "comgooglemaps://?q=\(name)&zoom=15&views=traffic") else { return }
            
            UIApplication.shared.open(fullURL, options: [:])
        }
        
    }
}
