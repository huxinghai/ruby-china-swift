//
//  TopicsController.swift
//  ruby-china-swift
//
//  Created by kaka on 16/1/24.
//  Copyright © 2016年 kaka. All rights reserved.
//

import UIKit

class TopicsController: BaseTopicListController {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.estimatedRowHeight = 55
        tableView.rowHeight = UITableViewAutomaticDimension
        
        self.navigationItem.title = "社区"
        
        ClientApi.topics(["type": "last_actived"]){ (topics) -> Void in
            NSLog("Topic controller data.....\(topics.count)")
            self.dataSource = topics
            self.tableView.reloadData()
        }
    }
    
}
