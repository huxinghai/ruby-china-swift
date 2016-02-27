//
//  HomeController.swift
//  ruby-china-swift
//
//  Created by kaka on 16/1/23.
//  Copyright © 2016年 kaka. All rights reserved.
//

import UIKit

class HomeController: BaseTopicListController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "精帖"
        
        tableView.estimatedRowHeight = 55
        tableView.rowHeight = UITableViewAutomaticDimension
        
        tableView.delegate = self
        tableView.dataSource = self
        ClientApi.topics(["type": "excellent"]){ (topics) -> Void in
            NSLog("Home controller data....\(topics.count).")
            self.dataSource = topics
            self.tableView.reloadData()
        }
        
        let loadImage = UIImageView(image: UIImage(named: "big_logo"))
        loadImage.frame = CGRectMake(0, 0, 80, 80)
        loadImage.center = self.view.center
        self.view.addSubview(loadImage)
        self.view.alpha = 0.4
        UIView.animateWithDuration(2, animations: {() -> Void in
            self.view.alpha = 1
        }) { (Bool) -> Void in
            loadImage.hidden = true
        }
    }

}
