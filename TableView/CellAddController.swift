//
//  CellAddController.swift
//  TableView
//
//  Created by USER on 2020/01/06.
//  Copyright © 2020 Akidon. All rights reserved.
//

import UIKit
//var cellList:[[String]] = []
//var cellNum:Int = 0
//var sender1:Int = 0

class CellAddController: UIViewController {
    
    @IBOutlet weak var cellTextView: UITextField!
    
    @IBAction func Button(_ sender: Any) {
        //cellList.append([])
        cellList[indexPath_section].append(cellTextView.text!)
        
        //追加ボタンを押したらフィールドを空にする
        cellTextView.text = ""
        
        //セクションの数を１つ増やす。
        cellNum += 1
        
        //変数の中身をUDに追加 アプリを落としても記憶する
        //UserDefaults.standard.set(sectionTitles, forKey: "sctionTitles" )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    //最初からあるコード
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
