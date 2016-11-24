//
//  ViewController.swift
//  FMDB-Swift
//
//  Created by Artron_LQQ on 2016/11/23.
//  Copyright © 2016年 Artup. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 创建数据库文件
        LZSqlite.createSqliteWithName("myTable")

        // 建表
        LZSqlite.createTable("table")
        
        // 删除表
//        LZSqlite.deleteTable("table")

//        LZSqlite.alterElement("ddddd", toTable: "table")
        
        
        
        for _ in 0...10 {
            
            let model = LZDataModel()
            model.identifier = "id\(arc4random()%10000 + 100)"
            model.userName = "name\(arc4random()%100 + 10)"
            model.groupID = "groupid\(arc4random()%1000 + 100)"
            model.groupName = "group\(arc4random()%100 + 10)"
            model.password = "password\(arc4random()%1000 + 100)"
            
//            LZSqlite.insertOptional(model: model, toTable: "table")
            LZSqlite.insert(model: model, toTable: "table")
        }
//
        
//        LZSqlite.update(model: model, inTable: "table")
//        LZSqlite.delete(model: model, fromTable: "table")
        
        print(LZSqlite.countOf(table: "table"))
        
        print(LZSqlite.selectAllFromTable("table")!)
        
//        print(LZSqlite.selectModelWithID("id124", fromTable: "table"))
//

        
        print("********************")
        
        let arr = LZSqlite.selectPart(10...20, fromTable: "table")!
        
        for model in arr {
            
            print(model.identifier!)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

