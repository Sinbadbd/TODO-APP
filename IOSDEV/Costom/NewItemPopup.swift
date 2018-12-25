//
//  NewItemPopup.swift
//  IOSDEV
//
//  Created by sinbad on 12/24/18.
//  Copyright © 2018 sinbad. All rights reserved.
//

import UIKit

class NewItemPopup:GDGradient {
    
     let cancle = GDButton(title: " Cancle ", type: .roundedText, radius: 8)
     let addBtn = GDButton(title: " Add ",type: .roundedText, radius: 8)
    let editText = GDTextField( placeholder: "Enter Something", inset:6)
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        self.layer.cornerRadius = 14
        let inset:CGFloat = 12
        //cancle.backgroundColor = UIColor.red
        
        addSubview(cancle)
        cancle.leftAnchor.constraint(equalTo: leftAnchor, constant: inset).isActive = true
        cancle.topAnchor.constraint(equalTo: topAnchor, constant: inset).isActive = true
        cancle.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        //btn action
        // cancle.addTarget(self, action: #selector(setter: self.cancle), for: .touchUpInside)
        
        cancle.addTarget(self, action: #selector(self.handleCancle), for: .touchUpInside)
        cancle.addTarget(self, action: #selector(self.handleAdd), for: .touchUpInside)
        
        
        // add button
        addSubview(addBtn)
        //addBtn.rightAnchor.constraint(equalTo: rightAnchor, constant: -15).isActive = true
        addBtn.rightAnchor.constraint(equalTo: rightAnchor, constant: inset * -1).isActive = true // 16 * -1 = 15
        addBtn.topAnchor.constraint(equalTo: topAnchor, constant: inset).isActive = true
        addBtn.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        addSubview(editText)
        editText.leftAnchor.constraint(equalTo: leftAnchor, constant: inset).isActive = true
        editText.rightAnchor.constraint(equalTo: rightAnchor, constant: inset * -1).isActive = true
        editText.topAnchor.constraint(equalTo: addBtn.bottomAnchor, constant: 10).isActive = true
        editText.heightAnchor.constraint(equalToConstant: 28).isActive = true
    }
    // cancle
    
    @objc func handleCancle(){
        
    }
    
    @objc func handleAdd(){
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
