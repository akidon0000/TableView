//
//  SectionAdd.swift
//  TableViewStudy
//
//  Created by USER on 2020/01/07.
//  Copyright © 2020 Akidon. All rights reserved.
//

import UIKit

class SectionAdd: UIViewController {
 
    @IBOutlet weak var SectionTextField: UITextField!
    
    @IBAction func SectionAddButton(_ sender: Any) {
        //配列に入力内容を入れる
        sectionTitles.append(SectionTextField.text!)
        //追加ボタンを押したらフィールドを空にする
        SectionTextField.text = ""
        //セクションの数を１つ増やす。
        sectionNum += 1
        cellList.append([])
        //変数の中身をUDに追加 アプリを落としても記憶する
        //print(sectionTitles)
        //UserDefaults.standard.set(sectionTitles, forKey: "sectionTitles" )
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
