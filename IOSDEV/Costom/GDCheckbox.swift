//
//  GDCheckbox.swift
//  IOSDEV
//
//  Created by sinbad on 1/4/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import UIKit

class GDCheckbox: UIButton {
    
    
    var toggled: Bool? {
        didSet {
            if let toggled = toggled {
                if toggled {
                    backgroundColor = .green
                } else {
                    backgroundColor = .clear
                }
            }
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
         
        layer.borderColor = UIColor.gray.cgColor
        layer.borderWidth = 1
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
