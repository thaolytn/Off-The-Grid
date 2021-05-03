//
//  DescriptionView.swift
//  Off The Grid
//
//  Created by Lynn Ngo on 4/26/21.
//

import UIKit

class DescriptionView: UIView {
    
    @IBOutlet weak var featureName: UILabel!
    
    
    // MARK: - Init Functions
    override init(frame: CGRect) {
        super.init(frame: frame)
 
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    required convenience init(feature: MGLPointFeature) {
        
        self.init(frame: CGRect())
        self.selectedFeature = feature
        
        // createItemView()
        
        updateLabels()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    
    // MARK: - Utility Functions
    public func updateLabels() {
        if let name : String = selectedFeature.attribute(forKey: "name") as? String {
            featureName.text = name
        }
    }
    
}
