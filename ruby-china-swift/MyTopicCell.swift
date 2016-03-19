//
//  MyTopicCell.swift
//  ruby-china-swift
//
//  Created by kaka on 16/3/19.
//  Copyright © 2016年 kaka. All rights reserved.
//

import UIKit

class MyTopicCell: UITableViewCell{
    
    var titleLabel = UILabel()
    var create_at = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(create_at)
        
        self.titleLabel.numberOfLines = 0
        self.titleLabel.lineBreakMode =  NSLineBreakMode.ByCharWrapping
        self.titleLabel.font = UIFont.systemFontOfSize(15)
        
        self.create_at.textColor = UIColor.grayColor()
        self.create_at.font = UIFont.systemFontOfSize(12)
        
        let padding: UIEdgeInsets = UIEdgeInsetsMake(8, 8, 8, 8)
        
        self.create_at.snp_makeConstraints { (make) -> Void in
            make.right.equalTo(padding.right).inset(10)
        }
        
        self.titleLabel.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(padding.left)
            make.top.equalTo(padding.top).inset(20)
        }

        
    }
    
    func bind(topic: Topic){
        titleLabel.text = topic.title
        create_at.text = topic.createdAtAgo()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}