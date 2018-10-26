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
    var type:ButtonOption!
    
    
    init(title: String = "Button", frame:CGRect = .zero, type:ButtonOption = .roundedText) {
        super.init(frame: frame)
        if frame == .zero {
            self.translatesAutoresizingMaskIntoConstraints = false
        }
        self.title = title
        self.type = type
        self.phaseTwo()
        
        
        switch type {
        case .roundedText:
            roundedText()
            break
        case .squareIcon:
            break
        default:
            break
        }
    }
    
    
    func roundedText(){
        self.layer.cornerRadius = 18
    }
    func squareIcon(){
        if let titeleLabel = self.titleLabel {
            titeleLabel.font = UIFont(name: "OpenSans-Regular.ttf" , size: 24)
        }
    }
    
    func phaseTwo(){
        self.setTitleColor(.grayZero, for: .normal)
        self.setTitle(self.title, for: .normal)
        self.backgroundColor = .white
        if let titeleLabel = self.titleLabel {
            titeleLabel.font = UIFont(name: "OpenSans-Regular.ttf" , size: 16)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
