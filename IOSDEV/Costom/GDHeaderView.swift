//
//  GDHeaderView.swift
//  IOSDEV
//
//  Created by sinbad on 10/25/18.
//  Copyright © 2018 sinbad. All rights reserved.
//

import UIKit

class GDHeaderView: UIView {
    
    let bg = GDGradient()
    
    //let titleLabel = GDLabel(size: 24 )
    //let subTitleLabel = GDLabel(size: 24)
    
    
    
    
    init(frame: CGRect = .zero, title:String = "Header Title", subtitle:String = "header subtitle") {
        super.init(frame: frame)
        if frame == .zero {
            translatesAutoresizingMaskIntoConstraints = false
        }
        
        self.titleLabel.text = title
        self.subTitleLable.text = subtitle
        setupView()
    }
    
    
    let titleLabel: UILabel = {
        let title = UILabel()
        title.textColor = .white
        title.font = UIFont.boldSystemFont(ofSize: 12)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    let subTitleLable: UILabel = {
        let subtitle = UILabel()
        subtitle.textColor = .white
        subtitle.font = UIFont.boldSystemFont(ofSize: 16)
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        return subtitle
    }()
    
    
    let addButton = GDButton(title: "+", type: .squareIcon)
    
    
    func setupView(){
        addSubview(bg)
        bg.topAnchor.constraint(equalTo: topAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        bg.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        bg.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        bg.addSubview(titleLabel)
        bg.addSubview(subTitleLable)
        bg.addSubview(addButton)
        
        // title
        titleLabel.centerYAnchor.constraint(equalTo: bg.centerYAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20+8).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        // subtitle
        subTitleLable.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        subTitleLable.leftAnchor.constraint(equalTo: leftAnchor, constant: 20+8).isActive = true
        subTitleLable.rightAnchor.constraint(equalTo: centerXAnchor, constant: 40).isActive = true
        
        //right icon
        addButton.bottomAnchor.constraint(equalTo: subTitleLable.bottomAnchor).isActive  = true
        addButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -20 - 8).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        addButton.widthAnchor.constraint(equalTo: addButton.heightAnchor, multiplier: 1).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
