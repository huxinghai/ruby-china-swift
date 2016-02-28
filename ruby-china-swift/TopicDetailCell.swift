//
//  TopicDetailCell.swift
//  ruby-china-swift
//
//  Created by kaka on 16/2/20.
//  Copyright © 2016年 kaka. All rights reserved.
//

import UIKit

class TopicDetailCell: UITableViewCell{
    
    var title = UILabel()
    var avatar = UIImageView()
    var author = UILabel()
    var createdAt = UILabel()
    var content = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.contentView.addSubview(title)
        self.contentView.addSubview(avatar)
        self.contentView.addSubview(author)
        self.contentView.addSubview(createdAt)
        self.contentView.addSubview(content)
        
        self.title.numberOfLines = 0
        self.title.lineBreakMode = NSLineBreakMode.ByCharWrapping
        self.title.font = UIFont.boldSystemFontOfSize(20)

        self.selectionStyle = UITableViewCellSelectionStyle.None

        
        self.content.numberOfLines = 0
        self.content.lineBreakMode = NSLineBreakMode.ByCharWrapping
        
        self.author.font = UIFont.boldSystemFontOfSize(15)
        self.createdAt.font = UIFont.systemFontOfSize(12)
        
        let padding: UIEdgeInsets = UIEdgeInsetsMake(8, 8, 8, 8)
        
        self.title.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(padding.left)
            make.top.equalTo(padding.top)
            make.right.equalTo(-5)
        }
        
        self.avatar.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.title.snp_bottom).offset(10)
            make.left.equalTo(padding.left)
            make.width.equalTo(25)
            make.height.equalTo(25)
        }
        
        self.author.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.avatar.snp_top).offset(5)
            make.left.equalTo(self.avatar.snp_right).offset(8)
        }
        
        self.createdAt.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.avatar.snp_top).offset(5)
            make.right.equalTo(padding.right).inset(5)
        }
        
        self.content.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.avatar.snp_bottom).offset(12)
            make.left.equalTo(padding.left)
            make.right.equalTo(-5)
        }
        
        self.contentView.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(self)
            make.bottom.equalTo(self.content.snp_bottom).inset(-padding.bottom)
        }
    
    }
    
    func bind(topic: Topic){
        self.title.text = topic.title
        self.author.text = topic.user?.name
        self.avatar.sd_setImageWithURL(NSURL(string: topic.user!.avatar_url!))
        self.createdAt.text = topic.createdAtAgo()
        self.content.text = topic.body
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
