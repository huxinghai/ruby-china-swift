//
//  URLs.swift
//  ruby-china-swift
//
//  Created by kaka on 16/2/18.
//  Copyright © 2016年 kaka. All rights reserved.
//

struct URLs {
    static let baseURL: String = "https://ruby-china.org"
    static let apiVersion: String = "/api/v3"
    static let apiURL = baseURL + apiVersion
    
    static let topicsURL = apiURL + "/topics"
}