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
        
        view.backgroundColor = .black
    
        let header = UILabel()
        header.text = "ABOUT PAGE"
        header.frame = CGRect(x: 150, y: 150, width: 300, height: 50)
        view.addSubview(header)
    }
}
