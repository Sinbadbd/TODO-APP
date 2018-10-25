//
//  GDHeaderView.swift
//  IOSDEV
//
//  Created by sinbad on 10/25/18.
//  Copyright © 2018 sinbad. All rights reserved.
//

import UIKit

class GDHeaderView: UIView {
    
    init(frame: CGRect = .zero, title:String = "Header Title", subtitle:String = "header subtitle") {
        super.init(frame: frame)
        if frame == .zero {
            translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
