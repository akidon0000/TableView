//
//  ViewController.swift
//  TableView
//
//  Created by USER on 2019/12/28.
//  Copyright © 2019 Akidon. All rights reserved.
//list = [["こんにちわ","机"],["Hello","table"]] list[0][0]
import UIKit

//var contents:[String] = []
var sectionHight:Int = 50
var indexPath_section:Int = 0
var indexPath_row:Int = 0
var sectionTitles:[String] = []
var sectionNum = 0
var cellList:[[String]] = []
var cellNum:Int = 0
//var sender1:Int = 0

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var TableView: UITableView!

//    @IBAction func clear(_ sender: Any) {
////        UserDefaults.standard.removeObject(forKey: "TodoList")
////        contents.removeAll()
////        sectionTitles.removeAll()
////        sectionNum = 0
////        cellNum = 0
//        cellNum += 1
//        //TableViewをリロードするメソッド
//        TableView.reloadData()
//    }
    
    /*
    セクション内のセル数を決めるメソッド（＊＊必須＊＊）
    cellList = [["a"],["b","c"]] で section = 0 の時 return値 は 1
     */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("a")
        return cellList[Int(section)].count
    }

    /*
    セルのインスタンスを生成するメソッド「表示するcellの中身を決める」（＊＊必須＊＊）
     indexPath.section は
     indexPath.item は
     */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let TodoCell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
        TodoCell.textLabel!.text = cellList[indexPath.section][Int(indexPath.item)]
        print(cellList)
        print(indexPath.section)
        print(indexPath.item)
        return TodoCell
    }

    /*
     テーブル内のセクション数を決めるメソッド
     */
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionNum
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
        return CGFloat(100)
    }
    
    /*
    セクションのタイトルを設定する
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
    
    //簡単な方法
    //    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    //        return "第\(section)セクション"
    //    }
        
    //カスタマイズしたい時
    //    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    //        let label = UILabel(frame: CGRect(x:0, y:0, width: tableView.bounds.width, height: 50))
    //        label.text = "第\(section)セクション"
    //        label.textAlignment = NSTextAlignment.center     //文字位置変更[.right][.center][.left]
    //        label.font = UIFont.italicSystemFont(ofSize: 21) //文字サイズ変更
    //        label.backgroundColor = UIColor.red              //背景色変更
    //        label.textColor =  UIColor.white                 //文字色変更
    //        return label
    //    }
    
    
    
    /*
    セルを選択した時のイベントを追加
    */
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexPath_section = indexPath.section
        indexPath_row = indexPath.row
        let storyboard: UIStoryboard = self.storyboard!
        let second = storyboard.instantiateViewController(withIdentifier: "cellTapped")
        self.present(second, animated: true, completion: nil)
    }

/*
画面が新しく作られる時、毎回ここを通る
*/
    override func viewDidLoad() {
        super.viewDidLoad()
        //navigationItem.leftBarButtonItem = editButtonItem
        
        
        //if UserDefaults.standard.object(forKey: "sectionTitles") != nil {
            //contents = UserDefaults.standard.object(forKey: "sectionTitles") as! [String]
    }
}
    
/*
警告を受け取った時に呼ばれるメソッド。メモリ開放など
*/
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
//}
