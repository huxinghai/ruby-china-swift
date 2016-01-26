//
//  BaseListController.swift
//  ruby-china-swift
//
//  Created by kaka on 16/1/26.
//  Copyright © 2016年 kaka. All rights reserved.
//

import UIKit

class BaseListController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    var dataSource = []
    let identid = "cellid"
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        NSLog("Home controller data....\(dataSource.count).")
        return dataSource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(identid)
        if(cell == nil){
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: identid)
        }
        let item = dataSource[indexPath.row] as? NSDictionary
        cell!.textLabel?.text = item!["title"] as? String
        cell!.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        let user: NSDictionary? = item!["user"] as? NSDictionary
        let avatar_url = NSURL(string: (user!["avatar_url"] as? String)!)
        cell!.imageView?.image = UIImage(data: NSData(contentsOfURL: avatar_url!)!)
        return cell!;
    }
}
