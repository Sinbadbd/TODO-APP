//
//  GDGradient.swift
//  IOSDEV
//
//  Created by sinbad on 10/9/18.
//  Copyright © 2018 sinbad. All rights reserved.
//

import UIKit

class GDGradient:UIView {
    
    // rgb color array init
    var colors:[CGColor] = [
        UIColor.init(red: 100, green:228, blue: 255).cgColor,
        UIColor.init(red:58, green:123, blue:213).cgColor
    ]
    
    // hex color array init
    var hexcolors:[CGColor] = [
        UIColor.init(rgb: 0x64E4FF).cgColor,
        UIColor.init(rgb: 0x3A7BD5).cgColor,
        UIColor.init(rgb: 0x3A7BD5).cgColor
    ]
    
    var staticColor:[CGColor] = [
        UIColor.blueZero.cgColor,
        UIColor.blueOne.cgColor
    ]
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
        if frame == .zero {
            translatesAutoresizingMaskIntoConstraints = false
        }
        if let layer = self.layer as? CAGradientLayer {
            
            self.translatesAutoresizingMaskIntoConstraints = false
            layer.colors = self.staticColor
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
