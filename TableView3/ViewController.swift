//
//  ViewController.swift
//  TableView
//
//  Created by USER on 2019/12/28.
//  Copyright © 2019 Akidon. All rights reserved.
//
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var TableView: UITableView!
    @IBAction func clear(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "TodoList")
        Contents.removeAll()
        TableView.reloadData()
        //Contents.append("クリア")
    }
    
    //UITableView、numberOfRowsInSectionの追加(表示するcell数を決める)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //戻り値の設定(表示するcell数)
        return Contents.count
    }

    //UITableView、cellForRowAtの追加(表示するcellの中身を決める)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //変数を作る
        let TodoCell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
        //変数の中身を作る
        TodoCell.textLabel!.text = Contents[indexPath.row]
        //戻り値の設定（表示する中身)
        return TodoCell
    }

    //画面が作られる時、通る。
    override func viewDidLoad() {
        super.viewDidLoad()
        if UserDefaults.standard.object(forKey: "TodoList") != nil {
            Contents = UserDefaults.standard.object(forKey: "TodoList") as! [String]
        }
    }
    
    //最初からあるコード
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

