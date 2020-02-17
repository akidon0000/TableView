//
//  CellTappedController.swift
//  TableView
//
//  Created by USER on 2020/01/07.
//  Copyright © 2020 Akidon. All rights reserved.
//


import UIKit


class CellTappedController: UIViewController {
    
    @IBOutlet weak var CellLabel: UILabel!

    @IBOutlet weak var Name: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        CellLabel.text = cellList[indexPath_section][Int(indexPath_row)]
        Name.text = "第\(indexPath_section)セクションの\(indexPath_row)個目のセル"
        
    }
    //最初からあるコード
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
