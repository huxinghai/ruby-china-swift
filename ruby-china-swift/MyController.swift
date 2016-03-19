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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = UIRectEdge.None
        
        tableHeader = ProfileHeader(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 170))
        
        tableView = UITableView(frame: self.view.frame, style: UITableViewStyle.Plain)
        
        tableView?.delegate = self
        tableView?.dataSource = self
        
        tableView?.estimatedRowHeight = 44
        tableView?.rowHeight = UITableViewAutomaticDimension
        tableView?.tableHeaderView = tableHeader
        tableView?.tableHeaderView?.backgroundColor = self.navigationController!.navigationBar.backgroundColor
    
        self.navigationItem.title = "我的"
        self.view.addSubview(tableView!)

    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell();
    }
    
    
    
}
