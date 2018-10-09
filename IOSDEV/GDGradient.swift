//
//  GDGradient.swift
//  IOSDEV
//
//  Created by sinbad on 10/9/18.
//  Copyright © 2018 sinbad. All rights reserved.
//

import UIKit

class GDGradient:UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        if let layer = self.layer as? CAGradientLayer {
            
            self.translatesAutoresizingMaskIntoConstraints = false
            layer.colors = [UIColor.blue.cgColor, UIColor.gray.cgColor]
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
