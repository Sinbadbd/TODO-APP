//
//  GDTextField.swift
//  IOSDEV
//
//  Created by sinbad on 12/25/18.
//  Copyright © 2018 sinbad. All rights reserved.
//

import UIKit
class GDTextField: UITextField {
    
    var insets:UIEdgeInsets!
    
    init(frame: CGRect = .zero, placeholder:String = "placeholder", radius:CGFloat = 4, inset:CGFloat = 8) {
        super.init(frame: frame)
        checkIfAoutoLayout()
        
        self.placeholder = placeholder
        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = radius
        self.insets = UIEdgeInsetsMake(0, inset, 0, 0)
        self.textColor = UIColor.gray
    }
    
    // text margin left
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, self.insets)
    }
//    override func textRect(forBounds bounds: CGRect) -> CGRect {
//        return UIEdgeInsetsInsetRect(bounds, self.insets)
//    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return  UIEdgeInsetsInsetRect(bounds, self.insets)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
