//
//  ClientApi.swift
//  ruby-china-swift
//
//  Created by kaka on 16/1/23.
//  Copyright © 2016年 kaka. All rights reserved.
//
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

class ClientApi{
    
    static func topics(options: [String: String],res: (topics: [Topic]) -> Void){
        Alamofire.request(.GET, URLs.topicsURL, parameters: options).responseObject{
            (response: Response<TopicResponse, NSError>) in
            if let data = response.result.value {
                res(topics: data.topics!)
            }
        
        }
    }
}