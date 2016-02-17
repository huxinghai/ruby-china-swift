//
//  User.swift
//  ruby-china-swift
//
//  Created by kaka on 16/2/17.
//  Copyright © 2016年 kaka. All rights reserved.
//

import ObjectMapper

class User: Mappable{
    var id: Int?
    var login: String?
    var name: String?
    var avatar_url: String?

    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map){
        id              <- map["id"]
        login           <- map["login"]
        name            <- map["name"]
        avatar_url      <- map["avatar_url"]
    }
}