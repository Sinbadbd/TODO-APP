//
//  GDCheckbox.swift
//  IOSDEV
//
//  Created by sinbad on 1/4/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import UIKit

class GDCheckbox: UIButton {
    
    
    var id: Int?
    var toggled: Bool? {
        didSet {
            if let toggled = toggled {
                UIView.animate(withDuration: 0.2, animations: {
                    if toggled {
                        self.backgroundColor = .green
                        self.setImage(UIImage(named: "done-icon"), for: .normal)
                    } else {
                        self.backgroundColor = .clear
                        self.setImage(UIImage(), for: .normal)
                    }
                })
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
