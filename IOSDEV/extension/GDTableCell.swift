//
//  GDTableCell.swift
//  IOSDEV
//
//  Created by sinbad on 1/2/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import UIKit
class GDTableCell : UITableViewCell {
    
    //    let titleLabel : UILabel = {
    //        let title = UILabel()
    //        title.textColor = .grayZero
    //        title.font = UIFont(name: "OpenSans-Regular.ttf", size: 14)
    //        title.translatesAutoresizingMaskIntoConstraints = false
    //
    //        return title
    //    }()
    
    let titleLabel = GDTextField( placeholder: "Todo", radius: 4, inset: 14)
    
    let view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    var toDo: Todo? {
        didSet {
            if let toDo = toDo {
                self.titleLabel.text = toDo.title
                
            }
        }
    }
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .clear
        textLabel?.textColor = .gray
        view.backgroundColor = UIColor.white
        
        addSubview(view)
        view.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        view.topAnchor.constraint(equalTo: topAnchor, constant: 4).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4).isActive = true
        view.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        
        addSubview(titleLabel)
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 4).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
