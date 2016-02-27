//
//  ReplyResponse.swift
//  ruby-china-swift
//
//  Created by kaka on 16/2/27.
//  Copyright © 2016年 kaka. All rights reserved.
//

import ObjectMapper

class RepliesResponse: Mappable{
    
    var replies: [Reply]?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        replies     <- map["replies"]
    }
    
}
