//
//  TopicDetailController.swift
//  ruby-china-swift
//
//  Created by kaka on 16/1/31.
//  Copyright © 2016年 kaka. All rights reserved.
//

import UIKit

class TopicDetailController: UIViewController {
    
    var topicId: Int!
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "帖子详情"
        let request = NSURLRequest(URL: NSURL(string: "https://ruby-china.org/topics/\(topicId)")!)
        webView.loadRequest(request)
    }
}
