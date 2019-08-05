//
//  ListController.swift
//  IOSDEV
//
//  Created by sinbad on 10/15/18.
//  Copyright © 2018 sinbad. All rights reserved.
//

import UIKit
import RealmSwift

class ListController: UIViewController , GDHeaderDeletegate, NewItemPopupDelegate{
    
    func notList(text: String) -> Bool {
        var isNotInList = true
        
        self.listData.forEach { (toDo) in
            if toDo.title == text {
                isNotInList = false
            }
        }
        return isNotInList
    }
    
    let realm = try! Realm()
    
    // let todoList = [Todo]
    // Generate auto-increment id manually
    private func incrementID() -> Int {
        return (realm.objects(Todo.self).max(ofProperty: "id") as Int? ?? 0) + 1
    }
    func addItemToList(text:String) {
        
        if notList(text: text) {
            let toDo = Todo()
            try! realm.write {
                
                toDo.id = incrementID()
                toDo.title = text
                let saveData =  realm.add(toDo, update: true)
                
                print(Realm.Configuration.defaultConfiguration.fileURL!)
                
                print("save\(saveData)")
            }
            self.listData.append(toDo)
            DispatchQueue.main.async {
                
                self.listTable.reloadData()
                self.updateHeaderItem()
                self.popUp.editText.text = ""
                self.popUp.animationPopUp()
            }
            
        }else {
            let alertController = UIAlertController(title: text, message: "\(text) is Exits!", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
            self.present(alertController, animated: true, completion: nil)
            //            self.popUp.editText.text = ""
            //            self.popUp.animationPopUp()
        }
    }
    
    func openAddItenPopup() {
        popUp.animationPopUp()
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
    
    var bgBottom:NSLayoutConstraint!
    
    var listItem = [Todo]()
    
    // keyboard handle
    override func viewDidAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardDidShow, object: nil)
    }
    
    
    @objc func keyboardWillShow(notification: Notification) {
        let keyboardSize = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.size
        self.keybordHeight = keyboardSize.height
    }
    
    func updateHeaderItem () {
        header.itemsLeft = 0
        self.listData.forEach { (toDo) in
            if !toDo.status {
                header.itemsLeft += 1
            }
        }
    }
    func fetchData(){
        let realm = try! Realm()
        listData = Array(realm.objects(Todo.self))
        // var arr = [listData]
        // listData.append(listItem)
        // listData.append(listData)
        print(listData)
        //        for toDo in toDo {
        //            print(todo.title)
        //        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        self.updateHeaderItem()
        fetchData()
        listData = []
        
        //  RealmResults<toDo> result1 = query.findAll();
        
        
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
        bgBottom = bg.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
        bgBottom.isActive = true
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
        openAddItenPopup()
        
        popUp.editText.delegate = self
        popUp.delegate = self
        
        header.delegate = self
        
        listTable.delegate = self
        listTable.dataSource = self
        listTable.register(GDTableCell.self, forCellReuseIdentifier: CELL_ID)
        
        DispatchQueue.main.async {
            self.listTable.reloadData()        }
        
    }
}


extension ListController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.bgBottom.constant = -keybordHeight - 100
        
        UIView.animate(withDuration: 0) {
            self.view.layoutIfNeeded()
        }
        
        popUp.animateView(transform: CGAffineTransform(translationX: 0, y: -keybordHeight), duration: 0.40)
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.bgBottom.constant = -100
        
        UIView.animate(withDuration: 0) {
            self.view.layoutIfNeeded()
        }
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
        self.updateHeaderItem()
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
        
        return listData.count
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
        
        cell.toDo = listData[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    
}

