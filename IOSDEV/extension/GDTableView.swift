//
//  GDTableView.swift
//  IOSDEV
//
//  Created by sinbad on 1/1/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import UIKit

class GDTableView: UITableView {
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        
        checkIfAoutoLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
