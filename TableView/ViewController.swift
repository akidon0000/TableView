//
//  ViewController.swift
//  TableView
//
//  Created by USER on 2019/12/28.
//  Copyright © 2019 Akidon. All rights reserved.
//list = [["こんにちわ","机"],["Hello","table"]] list[0][0]
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var TableView: UITableView!
    
    @IBAction func clear(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "TodoList")
        contents.removeAll()
        sectionNum = 0
        /*
         TableViewをリロードするメソッド
         */
        TableView.reloadData()
    }
    
    var contents:[String] = []
    
    
    /*
    テーブル内のセクション数を決めるメソッド
     */
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionNum
    }
    
    /*
    セクション内のセル数を決めるメソッド（＊＊必須＊＊）
     */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellNum
    }

    /*
    セルのインスタンスを生成するメソッド「表示するcellの中身を決める」（＊＊必須＊＊）
     */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let TodoCell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
        //TodoCell.textLabel!.text = contents[0]//[indexPath.row]
        TodoCell.textLabel!.text = cellList[0][indexPath.row]
        return TodoCell
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
    
    
    @objc func buttonTapped(sender:UIButton){
        print(sender.tag)
        //まずは、同じstororyboard内であることをここで定義します
        let storyboard: UIStoryboard = self.storyboard!
        //ここで移動先のstoryboardを選択(今回の場合は先ほどsecondと名付けたのでそれを書きます)
        let second = storyboard.instantiateViewController(withIdentifier: "cellAdd")
        //ここが実際に移動するコードとなります
        self.present(second, animated: true, completion: nil)
    }
    
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        //let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 18))
        let view = UIView(frame: CGRect.zero)
        let label = UILabel(frame: CGRect(x:0, y:0, width: tableView.bounds.width, height: 50))
        label.text = "\(sectionTitles[section])"
        label.textAlignment = NSTextAlignment.center     //文字位置変更[.right][.center][.left]
        label.font = UIFont.italicSystemFont(ofSize: 21) //文字サイズ変更
        label.backgroundColor = UIColor.gray              //背景色変更
        label.textColor =  UIColor.black                 //文字色変更
        
        let button = UIButton(frame: CGRect(x:self.view.frame.maxX - 50, y:0, width:50, height: 50))
        button.setTitle("追加", for: .normal)
        //button.adjustsImageWhenHighlighted = true
        //ボタンにタグをつける
        button.tag = section
        
        //buttonがタップされた際のコード　(buttonTappedはタップされた際に呼び出される関数)
        button.addTarget(self, action: #selector(ViewController.buttonTapped(sender:)), for: .touchUpInside)
        
        button.backgroundColor = UIColor.black
        
        //セクションバーの上にあるviewに加える（add）
        view.addSubview(label)
        view.addSubview(button)
        return view
    }
    
    
    
    
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        switch(indexPath.section) {
//        case 0:
//            let cell = tableView.dequeueReusableCell(withIdentifier: "row1") as! UITableViewCell;
//            return cell
//        case 1:
//            let cell = tableView.dequeueReusableCell(withIdentifier: "row2") as! UITableViewCell;
//            return cell
//        default:
//            let cell = tableView.dequeueReusableCell(withIdentifier: "row1") as! UITableViewCell;
//            return cell
//        }
//    }
    
    
    
    
    /*
    セクションの高さを設定
    */
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(50)
    }
    
/*
セルを選択した時のイベントを追加
*/
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("第\(indexPath.section)セクションの\(indexPath.row)番セルが選択されました")
    }

/*
画面が新しく作られる時、毎回ここを通る
*/
    override func viewDidLoad() {
        super.viewDidLoad()
        if UserDefaults.standard.object(forKey: "sectionTitles") != nil {
            contents = UserDefaults.standard.object(forKey: "sectionTitles") as! [String]
        }
    }
    
/*
警告を受け取った時に呼ばれるメソッド。メモリ開放など
*/
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
