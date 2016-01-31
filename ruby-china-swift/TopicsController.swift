//
//  TopicsController.swift
//  ruby-china-swift
//
//  Created by kaka on 16/1/24.
//  Copyright © 2016年 kaka. All rights reserved.
//

import UIKit

class TopicsController: BaseListController {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        tableView.dataSource = self
        tableView.delegate = self
        
        self.navigationItem.title = "社区"
        
        ClientApi.topics(["type": "last_actived"]){ (items) -> Void in
            NSLog("Topic controller data.....")
            self.dataSource = items as NSArray
            self.tableView.reloadData()
        }
    }
    
}
