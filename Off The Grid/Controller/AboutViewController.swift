//
//  AboutViewController.swift
//  Off The Grid
//
//  Created by Thaoly Ngo on 5/5/21.
//

import UIKit

class AboutViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backArrowImage = UIImage(named: "back-button-white")
        navigationController?.navigationBar.backIndicatorImage = backArrowImage
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = backArrowImage
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = .clear
        //navigationController?.navigationBar.barTintColor = UIColor(red: 0.13, green: 0.13, blue: 0.13, alpha: 1.00)
        navigationController?.navigationBar.tintColor = .white
        
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
    }
}
