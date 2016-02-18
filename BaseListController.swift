//
//  BaseListController.swift
//  ruby-china-swift
//
//  Created by kaka on 16/1/26.
//  Copyright © 2016年 kaka. All rights reserved.
//

import UIKit

class BaseListController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    var dataSource: [Topic] = []
    let identid = "cellid"
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(identid)
        if(cell == nil){
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: identid)
        }
        let topic = dataSource[indexPath.row] as? Topic
        cell!.textLabel?.text = topic?.title
        let avatar_url = NSURL(string: (topic?.user?.avatar_url)!)
        cell!.imageView?.image = UIImage(data: NSData(contentsOfURL: avatar_url!)!)
        cell!.tag = (topic?.id)!
        return cell!;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("topicDetail") as? TopicDetailController
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        controller?.topicId = cell?.tag
        self.navigationController?.pushViewController(controller!, animated: true)
    }
}
