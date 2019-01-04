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
    
    @objc func toggleStatus(){
        if let status = toggled {
            toggled = !status
//            print(toggled)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
         
        layer.borderColor = UIColor.gray.cgColor
        layer.borderWidth = 1
        
        addTarget(self, action: #selector(toggleStatus), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
