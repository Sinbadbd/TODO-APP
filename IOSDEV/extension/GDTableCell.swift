//
//  GDTableCell.swift
//  IOSDEV
//
//  Created by sinbad on 1/2/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import UIKit
class GDTableCell : UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .white
        textLabel?.textColor = .gray
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
