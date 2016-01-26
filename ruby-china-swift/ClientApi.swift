//
//  ClientApi.swift
//  ruby-china-swift
//
//  Created by kaka on 16/1/23.
//  Copyright © 2016年 kaka. All rights reserved.
//

import Foundation


extension String {
    
    func stringByAddingPercentEncodingForURLQueryValue() -> String {
        let characterSet = NSMutableCharacterSet.alphanumericCharacterSet()
        characterSet.addCharactersInString("-._~")
        
        return self.stringByAddingPercentEncodingWithAllowedCharacters(characterSet)!
    }
    
}

extension NSDictionary {
    
    
    func stringFromHttpParameters() -> String {
        let parameterArray = self.map { (key, value) -> String in
            let percentEscapedKey = (key as! String).stringByAddingPercentEncodingForURLQueryValue()!
            let percentEscapedValue = (value as! String).stringByAddingPercentEncodingForURLQueryValue()!
            return "\(percentEscapedKey)=\(percentEscapedValue)"
        }
        
        return parameterArray.joinWithSeparator("&")
    }
    
}


class ClientApi{
    static let baseUri = "https://ruby-china.org"
    
    static func topics(options: NSDictionary = [String: String](),res: (c: NSArray) -> Void){
        let params = options.stringFromHttpParameters()
        let url = "\(baseUri)/api/v3/topics?\(params)"
        let request = NSURLRequest(URL: NSURL(string: url)!)
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue()) {
            (_, data, e) -> Void in
            do {
                let results = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions(rawValue: 0)) as? NSDictionary
                res(c: (results!["topics"] as? NSArray)!)
//                NSLog("\(results)")
            }catch let error as NSError {
                NSLog("\(error)")
            }
            
            
        }
        
    }
}