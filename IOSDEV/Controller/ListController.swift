//
//  ListController.swift
//  IOSDEV
//
//  Created by sinbad on 10/15/18.
//  Copyright © 2018 sinbad. All rights reserved.
//

import UIKit
class ListController: UIViewController {
    
    let header = GDHeaderView( title: "Stuff to get done", subtitle: "10 LEFT")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(header)
        header.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        header.heightAnchor.constraint(equalToConstant: 120).isActive = true
        header.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        header.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        
    }
}
