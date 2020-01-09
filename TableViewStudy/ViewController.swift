//
//  ViewController.swift
//  TableViewStudy
//
//  Created by USER on 2020/01/07.
//  Copyright © 2020 Akidon. All rights reserved.
//

import UIKit
//２次元配列　セルの内容が入る
var cellList:[[String]] = [["Tokyo","Osaka"],["NewYork"]]
//セクションの名前が入る
var sectionTitles:[String] = ["Japan","USA"]
//セクションの数
var sectionNum = 0
//セクションの高さ
var sectionHight:Int = 50
//セルの数
var cellNum:Int = 0
//セルの高さ
var cellHight:Int = 100
//セクション番号
var indexPath_section:Int = 0
//セル番号
var indexPath_row:Int = 0

var aaa = true
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let editButton = UIButton() //
    
    @IBOutlet weak var TableView: UITableView!
//    @IBAction func Clear(_ sender: Any) {
//        cellList.removeAll()
//        sectionTitles.removeAll()
//        sectionNum = 0
//        cellNum = 0
//        TableView.reloadData()
//    }
    
    @IBAction func Editer(_ sender: Any) {
        if aaa == true{
            TableView.setEditing(true, animated: true)
            aaa = false
        } else {
            TableView.setEditing(false, animated: true)
            aaa = true
        }
    }

    /*
    セクション内のセル数を決めるメソッド（＊＊必須＊＊）
    cellList = [["a"],["b","c"]] で section = 0 の時 return値 は 1
     */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellList[Int(section)].count
    }

    /*
     セルのインスタンスを生成するメソッド「表示するcellの中身を決める」（＊＊必須＊＊）
     */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let TableCell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath)
        TableCell.textLabel!.text = cellList[indexPath.section][Int(indexPath.item)]
        return TableCell
    }
    
    /*
     テーブル内のセクション数を決めるメソッド
     */
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    /*
    セクションの高さを設定
    */
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(sectionHight)
    }
    
    /*
    セルの高さを決めるメソッド
     */
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(cellHight)
    }
    
    /*
    セクションのラベルを設定する
     */
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect.zero) //zeroは目一杯に広げる
        //tableView.bounds.width はスマホの横幅を取得するメソッド
        let label = UILabel(frame: CGRect(x:0, y:0, width: tableView.bounds.width, height: 50))
        label.text = "\(sectionTitles[section])" //追加の際入力した文字を表示
        label.textAlignment = NSTextAlignment.center     //文字位置変更[.right][.center][.left]
        label.font = UIFont.italicSystemFont(ofSize: 21) //文字サイズ変更
        label.backgroundColor = UIColor.gray              //背景色変更
        label.textColor =  UIColor.black                 //文字色変更
        //self.view.frame.maxX は横幅の最大値を取得　基本的には左上が座標(0,0)
        let button = UIButton(frame: CGRect(x:self.view.frame.maxX - 50, y:0, width:50, height: 50))
        button.backgroundColor = UIColor.black
        button.setTitle("追加", for: .normal)
        button.tag = section //ボタンにタグをつける
        //追加ボタンがタップされた際に画面遷移をする(buttonTappedはタップされた際に呼び出される関数)
        button.addTarget(self, action: #selector(ViewController.buttonTapped(sender:)), for: .touchUpInside)
        //セクションバーの上にあるviewに加える 階層として sectionBar > view > label = button
        view.addSubview(label)
        view.addSubview(button)
        return view
    }
    @objc func buttonTapped(sender:UIButton){
        indexPath_section = sender.tag
        //同じstororyboard内であることをここで定義
        let storyboard: UIStoryboard = self.storyboard!
        //移動先のstoryboardを選択(Identifierを指定する)
        let second = storyboard.instantiateViewController(withIdentifier: "cellAdd")
        //実際に移動するコード
        self.present(second, animated: true, completion: nil)
    }
    
    //セルがタップされた時、画面遷移する
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexPath_section = indexPath.section
        indexPath_row = indexPath.row
        let storyboard: UIStoryboard = self.storyboard!
        let second = storyboard.instantiateViewController(withIdentifier: "cellTapped")
        self.present(second, animated: true, completion: nil)
    }
    
    
    //セルの削除許可を設定
    func tableView(_ tableView: UITableView,canEditRowAt indexPath: IndexPath) -> Bool{
        return true
    }

    //セルの削除ボタンが押された時の処理
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        //削除するだけなのでindexPath_row = indexPath.rowをする必要はない。
        if editingStyle == UITableViewCell.EditingStyle.delete {
            cellList[indexPath.section].remove(at: indexPath.row)
            TableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDomain = Bundle.main.bundleIdentifier
        UserDefaults.standard.removePersistentDomain(forName: appDomain!)
        
        if UserDefaults.standard.array(forKey: "sectionTitles") != nil{
            sectionTitles = UserDefaults.standard.array(forKey: "sectionTitles") as! [String]
            sectionNum = sectionTitles.count
        }
    }
}
