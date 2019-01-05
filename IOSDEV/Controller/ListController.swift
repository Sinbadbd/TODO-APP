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
    
    
    let bg:UIView = {
        let view = GDGradient()
        view.layer.cornerRadius = 6
        return view
    }()
    
    let listTable = GDTableView()
    let CELL_ID = "cell_id"
    
    var listData:[Todo] = [Todo]()
    
    // var listItem = [Todo]()
    
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
        
        
        listData = [
            Todo(id:1, title: "this is test 1", status: true),
            Todo(id:2, title: "this is test 2", status: false),
            Todo(id:3, title: "this is test 3", status: true)
        ]
        
        
        view.addSubview(header)
        //popUp.backgroundColor = UIColor.red
        
        // Header contraint
        header.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        header.heightAnchor.constraint(equalToConstant: 120).isActive = true
        header.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        header.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        // main table view background
        view.addSubview(bg)
        bg.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        bg.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 20).isActive = true
        bg.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        bg.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        
        
        view.addSubview(listTable)
        listTable.leftAnchor.constraint(equalTo: bg.leftAnchor, constant: 8).isActive = true
        listTable.topAnchor.constraint(equalTo: bg.topAnchor, constant: 8).isActive = true
        listTable.bottomAnchor.constraint(equalTo: bg.bottomAnchor, constant: -8).isActive = true
        listTable.rightAnchor.constraint(equalTo: bg.rightAnchor, constant: -8).isActive = true
        
        // popup constraint
        
        view.addSubview(popUp)
        popUp.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        popUp.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        popUp.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        popUp.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        
        popUp.editText.delegate = self
        popUp.delegate = self
        
        header.delegate = self
        
        listTable.delegate = self
        listTable.dataSource = self
        listTable.register(GDTableCell.self, forCellReuseIdentifier: CELL_ID)
    }
}


extension ListController:UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        popUp.animateView(transform: CGAffineTransform(translationX: 0, y: -keybordHeight), duration: 0.40)
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        popUp.animateView(transform: CGAffineTransform(translationX: 0, y: 0), duration: 0.60)
    }
}

extension ListController : UITableViewDelegate, UITableViewDataSource, GDListCellDelegate {
    
    func toggleToDo(toDo updatedToDo : Todo) {
        let newListData = self.listData.map { (oldToDo) -> Todo in
            if oldToDo.id == updatedToDo.id {
              var newTodo = oldToDo
                newTodo.status = updatedToDo.status
                newTodo.title = updatedToDo.title
                return newTodo
            }
            return oldToDo
        }
        self.listData = newListData
        self.listTable.reloadData()
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "To Do"
        }
        return "Done"
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let titleForHeader = GDLabel(color: .white, size: 20, frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 44))
        if section == 0 {
            titleForHeader.text = "To Do"
        } else  {
            titleForHeader.text = "Done"
        }
        
        return  titleForHeader
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = 0
        
        self.listData.forEach { (toDo) in
            if section == 0 && !toDo.status {
                count += 1
            }else if section == 1 && toDo.status {
                count += 1
            }
        }
        
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_ID, for: indexPath) as! GDTableCell
        
        cell.delegate = self
        var listDataTable:[Todo] = []
        self.listData.forEach { (toDo) in
            if indexPath.section == 0 && !toDo.status {
                listDataTable.append(toDo)
            }else if indexPath.section == 1 && toDo.status {
                listDataTable.append(toDo)
            }
        }
        cell.toDo = listDataTable[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    
}

