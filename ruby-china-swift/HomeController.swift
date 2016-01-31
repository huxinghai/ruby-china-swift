//
//  HomeController.swift
//  ruby-china-swift
//
//  Created by kaka on 16/1/23.
//  Copyright © 2016年 kaka. All rights reserved.
//

import UIKit

class HomeController: BaseListController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "精帖"
        
        tableView.delegate = self
        tableView.dataSource = self
        ClientApi.topics(["type": "excellent"]){ (items) -> Void in
            self.dataSource = items as NSArray
            self.tableView.reloadData()
        }
    }

}
