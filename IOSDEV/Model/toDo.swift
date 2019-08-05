//
//  toDo.swift
//  IOSDEV
//
//  Created by sinbad on 1/3/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import Foundation
import RealmSwift
//struct Todo {
//    var id : Int
//    var title : String
//    var status : Bool
//}

class Todo : Object {
    @objc dynamic var id = 0
    @objc dynamic var title = ""
    @objc dynamic var status = false
    
    override static func primaryKey() -> String? {
        return "id"
    }
    //Incrementa ID
//    func IncrementaID() -> Int{
//        let realm = try! Realm()
//        if let retNext = realm.objects(Roteiro.self).sorted(byKeyPath: "id").first?.id {
//            return retNext + 1
//        }else{
//            return 1
//        }
//    }
}
