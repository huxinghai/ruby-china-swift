//
//  Reply.swift
//  ruby-china-swift
//
//  Created by kaka on 16/2/27.
//  Copyright © 2016年 kaka. All rights reserved.
//

import ObjectMapper

class Reply: Mappable{
    var id: Int?
    var body: String?
    var likes_count: Int?
    var user: User?
    var created_at: String?
    
    required init?(_ map: Map) {
        
    }
    
    func createdAtAgo() -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZ"
        let createAt = dateFormatter.dateFromString(self.created_at!)
        return (createAt?.timeAgoSinceNow())!
    }
    
    func mapping(map: Map){
        id              <- map["id"]
        body            <- map["body_html"]
        likes_count     <- map["likes_count"]
        user            <- map["user"]
        created_at      <- map["created_at"]
    }
}