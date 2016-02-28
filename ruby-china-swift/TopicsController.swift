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
        
        loadRefreshControl(tableView)
        refreshData()
    }
    
    override func loadMore() {
        fetchRemote{ (topics) -> Void in
            topics.forEach({ (topic) -> () in
                self.dataSource.append(topic)
                self.tableView.reloadData()
            })
        }
    }
    
    override func refreshData(){
        fetchRemote{ (topics) -> Void in
            NSLog("Topic controller data.....\(topics.count)")
            self.dataSource = topics
            self.tableView.reloadData()
            super.refreshData()
        }

    }
    
    func fetchRemote(success: (topics: [Topic]) -> Void){
        ClientApi.topics(["type": "last_actived", "offset": self.page]){ (topics) -> Void in
            success(topics: topics)
        }
    }
    
}
