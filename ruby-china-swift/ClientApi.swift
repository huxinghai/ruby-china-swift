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
            (response: Response<TopicsResponse, NSError>) in
            if let data = response.result.value {
                res(topics: data.topics!)
            }
        
        }
    }
    
    static func topic(id: Int, res: (topic: Topic) -> Void){
        Alamofire.request(.GET, "\(URLs.topicsURL)/\(id)").responseObject {
            (response: Response<TopicResponse, NSError>) in
//            NSLog((response.result.value?.toJSONString())!)
            if let data = response.result.value {
                res(topic: data.topic!)
            }
            
        }
    }
    
    static func login(username: String, password: String){
//        Alamofire.request(.GET, "\(URLs.topicsURL)/\(id)").responseObject {
    }
    
    static func topicReplies(topicId: Int, res: (replies: [Reply]) -> Void){
        Alamofire.request(.GET, "\(URLs.topicsURL)/\(topicId)/replies").responseObject {
            (response: Response<RepliesResponse, NSError>) -> Void in
            if let data = response.result.value{
                res(replies: data.replies!)
            }
            
        }
    }
}