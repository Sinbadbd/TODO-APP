//
//  GDButton.swift
//  IOSDEV
//
//  Created by sinbad on 10/15/18.
//  Copyright © 2018 sinbad. All rights reserved.
//

import UIKit

class GDButton: UIButton {
    
    var title:String!
    
    init(title: String = "Button", frame:CGRect = .zero) {
        super.init(frame: frame)
        if frame == .zero {
            self.translatesAutoresizingMaskIntoConstraints = false
        }
        self.title = title
        phaseTwo()
    }
    
    
    func phaseTwo(){
        self.setTitleColor(.grayZero, for: .normal)
        self.setTitle(self.title, for: .normal)
        self.layer.cornerRadius = 18
        self.backgroundColor = .white
        if let titeleLabel = self.titleLabel {
            titeleLabel.font = UIFont(name: "OpenSans-Regular.ttf" , size: 16)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
