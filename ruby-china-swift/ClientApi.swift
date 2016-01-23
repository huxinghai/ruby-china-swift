//
//  ClientApi.swift
//  ruby-china-swift
//
//  Created by kaka on 16/1/23.
//  Copyright © 2016年 kaka. All rights reserved.
//

import Foundation


class ClientApi{
    static let baseUri = "https://ruby-china.org"
    
    static func topics(res: (c: NSArray) -> Void){
        let url = "\(baseUri)/api/v3/topics"
        let request = NSURLRequest(URL: NSURL(string: url)!)
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue()) {
            (_, data, e) -> Void in
            do {
                let results = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions(rawValue: 0)) as? NSDictionary
                res(c: (results!["topics"] as? NSArray)!)
                NSLog("\(results)")
            }catch let error as NSError {
                NSLog("\(error)")
            }
            
            
        }
        
    }
}