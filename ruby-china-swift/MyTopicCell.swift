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
        self.titleLabel.contentHuggingPriorityForAxis(UILayoutConstraintAxis.Vertical)
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
            make.right.equalTo(padding.right).inset(8)
            make.top.equalTo(padding.top).inset(20)
        }
        
        self.contentView.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(self)
            make.bottom.equalTo(self.titleLabel.snp_bottom).inset(-padding.bottom)
        }
        
    }
    
    func bind(topic: Topic){
        self.tag = topic.id!
        titleLabel.text = topic.title
        create_at.text = topic.createdAtAgo()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}