//
//  GDGradient.swift
//  IOSDEV
//
//  Created by sinbad on 10/9/18.
//  Copyright © 2018 sinbad. All rights reserved.
//

import UIKit

class GDGradient:UIView {
    
    var colors:[CGColor] = [
        UIColor.init(red: 100, green:228, blue: 255).cgColor,
        UIColor.init(red:58, green:123, blue:213).cgColor
    ]
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        if let layer = self.layer as? CAGradientLayer {
            
            self.translatesAutoresizingMaskIntoConstraints = false
            layer.colors = self.colors
            layer.locations = [0.0,1.2]
        }
        
        
    }
    
    override class var layerClass : AnyClass {
        return CAGradientLayer.self
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
