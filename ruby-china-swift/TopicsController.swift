//
//  TopicsController.swift
//  ruby-china-swift
//
//  Created by kaka on 16/1/24.
//  Copyright © 2016年 kaka. All rights reserved.
//

import UIKit

class TopicsController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var dataSource = []
    override func viewDidLoad() {
        tableView.dataSource = self
        tableView.delegate = self
        
        ClientApi.topics(["type": "last_actived"]){ (items) -> Void in
            self.dataSource = items as NSArray
            self.tableView.reloadData()
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(frame: CGRect(x: 0, y: 0, width: 320, height: 30))
        let item = dataSource[indexPath.row] as? NSDictionary
        cell.textLabel?.text = item!["title"] as? String
        return cell;
    }

}
