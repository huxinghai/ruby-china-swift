//
//  MyController.swift
//  ruby-china-swift
//
//  Created by kaka on 16/2/20.
//  Copyright © 2016年 kaka. All rights reserved.
//

import UIKit

class MyController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView?
    var tableHeader: ProfileHeader?
    var page = 1
    var size = 8
    var topics: [Topic] = []
    var identid = "myTopicCellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = UIRectEdge.None
        
        tableHeader = ProfileHeader(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 170))
        tableHeader?.topicType.addTarget(self, action: "segmentDidchange:", forControlEvents: UIControlEvents.ValueChanged)
        
        tableView = UITableView(frame: self.view.frame, style: UITableViewStyle.Plain)
        
        tableView?.delegate = self
        tableView?.dataSource = self
        
        tableView?.estimatedRowHeight = 44.0
        tableView?.rowHeight = UITableViewAutomaticDimension
        tableView?.tableHeaderView = tableHeader
        tableView?.separatorInset = UIEdgeInsetsZero
        tableView?.layoutMargins = UIEdgeInsetsZero
    
        self.navigationItem.title = "我的"
        self.view.addSubview(tableView!)
        fetch_topic()

    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return topics.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(identid) as? MyTopicCell
        if(cell == nil){
            cell = MyTopicCell(style: UITableViewCellStyle.Default, reuseIdentifier: identid)
        }
        cell?.bind(topics[indexPath.row])
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("topicDetail") as? TopicDetailController
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        controller?.topicId = cell?.tag
        self.navigationController?.pushViewController(controller!, animated: true)
    }
    
    
    func segmentDidchange(segmented: UISegmentedControl){
        let type = segmented.selectedSegmentIndex == 0 ? "excellent" : "last_actived"
        fetch_topic(type)
    }
    
    func fetch_topic(type: String = "excellent"){
        ClientApi.topics(["type": type, "offset": self.page, "size": self.size]){ (data) -> Void in
            self.topics = data
            self.tableView!.reloadData()
        }
    }
    
    
}
