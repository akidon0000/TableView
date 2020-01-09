//
//  CellAdd.swift
//  TableViewStudy
//
//  Created by USER on 2020/01/07.
//  Copyright © 2020 Akidon. All rights reserved.
//

import UIKit

class CellAdd: UIViewController {
    
    @IBOutlet weak var CellTextField: UITextField!
    @IBAction func CellAddButton(_ sender: Any) {
    cellList[indexPath_section].append(CellTextField.text!)
    //追加ボタンを押したらフィールドを空にする
    CellTextField.text = ""
    //セルの数を１つ増やす。
    cellNum += 1
    
    //変数の中身をUDに追加 アプリを落としても記憶する
    //UserDefaults.standard.set(sectionTitles, forKey: "sctionTitles" )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


    

