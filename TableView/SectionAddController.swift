//
//  AddController.swift
//  TableView
//
//  Created by USER on 2019/12/29.
//  Copyright © 2019 Akidon. All rights reserved.
//


import UIKit

class AddController: UIViewController {
    @IBOutlet weak var TodoTextField: UITextField!
    
    @IBAction func TodoAddButten(_ sender: Any) {
        //配列に入力内容を入れる
        //contents.append([])
        //contents[sectionNum].append(TodoTextField.text!)
        sectionTitles.append(TodoTextField.text!)
        
        //追加ボタンを押したらフィールドを空にする
        TodoTextField.text = ""
        
        //セクションの数を１つ増やす。
        sectionNum += 1
        cellList.append([])
        //変数の中身をUDに追加 アプリを落としても記憶する
        //UserDefaults.standard.set(sectionTitles, forKey: "sctionTitles" )
    }

    //最初からあるコード
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    //最初からあるコード
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
}
