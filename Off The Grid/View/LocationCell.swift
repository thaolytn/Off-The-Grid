//
//  LocationCell.swift
//  Off The Grid
//
//  Created by Thaoly Ngo on 6/14/21.
//

import UIKit

class LocationCell: UITableViewCell {

    @IBOutlet weak var locationNameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        categoryLabel.layer.masksToBounds = true
        categoryLabel.layer.cornerRadius = categoryLabel.frame.size.height / 2
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
