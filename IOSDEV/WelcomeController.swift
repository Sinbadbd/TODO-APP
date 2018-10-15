//
//  ViewController.swift
//  IOSDEV
//
//  Created by sinbad on 10/8/18.
//  Copyright © 2018 sinbad. All rights reserved.
//

import UIKit

class WelcomeController: UIViewController {
    
    
    // UI view
    let bg:UIView = {
        let view = GDGradient()
        view.layer.cornerRadius = 6
        return view
    }()
    
    
    let titleLabel = GDLabel(title: "GET IT DONE", size: 24, textAlign: .center)
    let infoLabel:UILabel = {
        let label = GDLabel(title: "WELCOME. GET IT DONE IS A TO DO \nLIST.REALLY DOPE TO-DO LIST", size: 14, textAlign: .center)
        label.numberOfLines = 2
        return label
    }()
    
    let copyrightLabel:UILabel = {
        let copyright = GDLabel(title: "© 2018 Copyright", color: .grayOne, size: 12, textAlign: .center)
        return copyright
    }()
    
    let startButton = GDButton(title: "START WINDOW")
    
    @objc func nextStartButton(){
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
            self.startButton.transform = CGAffineTransform(scaleX: 0.9, y:0.9)
        }) { (_) in
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
                self.startButton.transform = CGAffineTransform(scaleX: 1, y:1)
            }) { (_) in
                self.present(ListController(), animated: true, completion: nil)
            }
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //next page with animation
        startButton.addTarget(self, action: #selector(self.nextStartButton), for: .allTouchEvents)
        
        view.backgroundColor = .white
        
        // main view
        view.addSubview(bg)
        bg.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        bg.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        bg.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        bg.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        
        // lable
        
        bg.addSubview(titleLabel)
        titleLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: bg.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: bg.topAnchor, constant: 60).isActive = true
        
        // mid text info
        bg.addSubview(infoLabel)
        infoLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        infoLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        infoLabel.centerXAnchor.constraint(equalTo: bg.centerXAnchor).isActive = true
        infoLabel.centerYAnchor.constraint(equalTo: bg.centerYAnchor).isActive = true
        
        //copy right text
        view.addSubview(copyrightLabel)
        copyrightLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        copyrightLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        copyrightLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        copyrightLabel.centerYAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        
        // button
        bg.addSubview(startButton)
        startButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        startButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        startButton.centerXAnchor.constraint(equalTo: bg.centerXAnchor).isActive = true
        startButton.centerYAnchor.constraint(equalTo: bg.bottomAnchor, constant: -60).isActive = true
        
    }

    
}

