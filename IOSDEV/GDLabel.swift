//
//  GDLabel.swift
//  IOSDEV
//
//  Created by sinbad on 10/11/18.
//  Copyright © 2018 sinbad. All rights reserved.
//

import UIKit

class GDLabel: UILabel {
    
    init(title: String,color:UIColor = .white, size:CGFloat = 16, textAlign:NSTextAlignment = .left ,frame: CGRect = .zero) {
        super.init(frame: .zero)
        if frame == .zero {
            self.translatesAutoresizingMaskIntoConstraints = false
        }
        self.text = title
        self.textColor = color
        self.font = UIFont.init(name: "OpenSans-Regular.ttf" , size: size)
        self.textAlignment = textAlign
    }
    
    
    
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
