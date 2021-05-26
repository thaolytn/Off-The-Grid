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
        
        let backArrowImage = UIImage(systemName: "arrow.backward")
        navigationController?.navigationBar.backIndicatorImage = backArrowImage
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = backArrowImage
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = false
        
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        view.backgroundColor = .black
    
        let header = UILabel()
        header.text = "ABOUT PAGE"
        header.frame = CGRect(x: 150, y: 150, width: 300, height: 50)
        view.addSubview(header)
    }
}
