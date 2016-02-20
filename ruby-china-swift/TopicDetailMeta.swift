//
//  TopicDetailMeta.swift
//  ruby-china-swift
//
//  Created by kaka on 16/2/20.
//  Copyright © 2016年 kaka. All rights reserved.
//

import ObjectMapper

class TopicDetailMeta: Mappable{
    
    var followed: Bool?
    var liked: Bool?
    var favorited: Bool?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map){
        followed            <- map["followed"]
        liked               <- map["liked"]
        favorited           <- map["favorited"]
    }
}