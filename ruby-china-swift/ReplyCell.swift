//
//  ReplyCell.swift
//  ruby-china-swift
//
//  Created by kaka on 16/2/20.
//  Copyright © 2016年 kaka. All rights reserved.
//

import UIKit

class ReplyCell: UITableViewCell{

    var avatar = UIImageView()
    var author = UILabel()
    var createdAt = UILabel()
    var body = UILabel()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(avatar)
        self.contentView.addSubview(author)
        self.contentView.addSubview(createdAt)
        self.contentView.addSubview(body)
        
        self.body.numberOfLines = 0
        self.body.lineBreakMode = NSLineBreakMode.ByCharWrapping

        let padding: UIEdgeInsets = UIEdgeInsetsMake(8, 8, 8, 8)
        
        self.author.font = UIFont.boldSystemFontOfSize(15)
        self.createdAt.font = UIFont.systemFontOfSize(12)
        
        self.avatar.snp_makeConstraints{ (make) -> Void in
            make.left.equalTo(padding.left)
            make.top.equalTo(padding.top)
            make.width.equalTo(25)
            make.height.equalTo(25)
        }
        
        self.createdAt.snp_makeConstraints{ (make) -> Void in
            make.top.equalTo(padding.top)
            make.right.equalTo(padding.right).inset(10)
        }
        
        self.author.snp_makeConstraints{ (make) -> Void in
            make.left.equalTo(self.avatar.snp_right).offset(8)
            make.top.equalTo(padding.top)
        }
        
        self.body.snp_makeConstraints{ (make) -> Void in
            make.top.equalTo(self.author.snp_bottom)
            make.left.equalTo(self.avatar.snp_right).offset(8)
            make.right.equalTo(-5)
        }
        
        self.contentView.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(self)
            make.bottom.equalTo(self.body.snp_bottom).inset(-padding.bottom)
        }
        
    }
    
    func bind(reply: Reply){
        self.author.text = reply.user?.name
        self.avatar.sd_setImageWithURL(NSURL(string: reply.user!.avatar_url!))
        self.createdAt.text = reply.createdAtAgo()
        self.body.text = reply.body
    }


    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
