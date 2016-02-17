//
//  Topic.swift
//  ruby-china-swift
//
//  Created by kaka on 16/2/17.
//  Copyright © 2016年 kaka. All rights reserved.
//

import ObjectMapper

class Topic: Mappable{
    var id: Int?
    var title: String?
    var node_name: String?
    var user: User?
    var body: String?
    var hits: Int?
    var likes_count: Int?
    var created_at: String?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map){
        id              <- map["id"]
        title           <- map["title"]
        node_name       <- map["node_name"]
        user            <- map["user"]
        body            <- map["body"]
        hits            <- map["hits"]
        likes_count     <- map["likes_count"]
        created_at      <- map["created_at"]
    }
}