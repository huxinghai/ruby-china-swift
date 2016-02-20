//
//  TopicResponse.swift
//  ruby-china-swift
//
//  Created by kaka on 16/2/18.
//  Copyright © 2016年 kaka. All rights reserved.
//

import ObjectMapper

class TopicsResponse: Mappable{
    
    var topics: [Topic]?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        self.topics <- map["topics"]
    }
}
