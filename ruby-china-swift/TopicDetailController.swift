//
//  TopicDetailController.swift
//  ruby-china-swift
//
//  Created by kaka on 16/1/31.
//  Copyright © 2016年 kaka. All rights reserved.
//

import UIKit

class TopicDetailController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var topicId: Int!
    var topic: Topic?


    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        self.navigationItem.title = "帖子详情"
        
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableViewAutomaticDimension
        
        ClientApi.topic(topicId){ (topic) -> Void in
            self.topic = topic
            self.tableView.reloadData()
        }
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(self.topic != nil){
            return 1
        }else{
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var topicCell: TopicDetailCell?
        if(indexPath.row == 0){
            topicCell = TopicDetailCell(style: UITableViewCellStyle.Default, reuseIdentifier: "topicHeader")
            topicCell?.bind(self.topic!)
            topicCell?.selectionStyle = UITableViewCellSelectionStyle.None
        }
        return topicCell!
//        tableView.dequeueReusableHeaderFooterViewWithIdentifier(<#T##identifier: String##String#>)
    }
    
}
