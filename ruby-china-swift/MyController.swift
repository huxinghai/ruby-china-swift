//
//  MyController.swift
//  ruby-china-swift
//
//  Created by kaka on 16/2/20.
//  Copyright © 2016年 kaka. All rights reserved.
//

import UIKit

class MyController: UIViewController {
    
    
    @IBOutlet weak var labView: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "我的"
    
        let content = "<a href='http://baidu.com'>111</a><code>fdsafdasfdsa</code><br /><h1>ceshi</h1>"
        let contentHtml = content.dataUsingEncoding(NSUnicodeStringEncoding)
        do{
            labView.attributedText = try NSAttributedString(data: contentHtml!, options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType], documentAttributes: nil)
        }catch let e as NSError {
            NSLog("\(e.code)")
        }
    }
}
