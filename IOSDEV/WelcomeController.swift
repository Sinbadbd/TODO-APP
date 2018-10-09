//
//  ViewController.swift
//  IOSDEV
//
//  Created by sinbad on 10/8/18.
//  Copyright © 2018 sinbad. All rights reserved.
//

import UIKit

class WelcomeController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(bg)
        
        bg.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        bg.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        bg.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        bg.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        
        
        
    }

    
    // UI view
    let bg:UIView = {
        let view = GDGradient()
        view.layer.cornerRadius = 6
        return view
    }()


}

