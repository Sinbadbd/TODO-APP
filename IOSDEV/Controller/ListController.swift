//
//  ListController.swift
//  IOSDEV
//
//  Created by sinbad on 10/15/18.
//  Copyright © 2018 sinbad. All rights reserved.
//

import UIKit
class ListController: UIViewController , GDHeaderDeletegate, NewItemPopupDelegate{
    
    
    func addItemToList(text:String) {
         print("add item to text\(text)")
    }
    
    func openAddItenPopup() {
        print("trying to add item to the list")
    }
    
    
    let header = GDHeaderView( title: "Stuff to get done", subtitle: "10 LEFT")
    let popUp = NewItemPopup()
    
    var keybordHeight:CGFloat = 280
    
    // keyboard handle
    override func viewDidAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardDidShow, object: nil)
    }
    
    
    
    @objc func keyboardWillShow(notification: Notification) {
        let keyboardSize = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.size
        self.keybordHeight = keyboardSize.height
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(header)
        
        //popUp.backgroundColor = UIColor.red
        
        // Header contraint
        header.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        header.heightAnchor.constraint(equalToConstant: 120).isActive = true
        header.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        header.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        // popup constraint
        
        view.addSubview(popUp)
        popUp.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        popUp.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        popUp.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        popUp.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        
        popUp.editText.delegate = self
        popUp.delegate = self
        // edit text field
        //view.addSubview(editField)
        
        
       header.delegate = self
        
    }
}


extension ListController:UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.25, delay: 0, usingSpringWithDamping: 0.85, initialSpringVelocity: 2, options: .curveEaseIn, animations: {
            self.popUp.transform = CGAffineTransform(translationX: 0, y: -self.keybordHeight)
        }, completion: nil)
    }
}





