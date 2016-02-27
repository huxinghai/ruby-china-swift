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
        
        self.avatar.snp_makeConstraints{ (make) -> Void in
            make.left.equalTo(padding.left)
            make.top.equalTo(padding.top)
            make.width.equalTo(25)
            make.height.equalTo(25)
        }
        
        self.createdAt.snp_makeConstraints{ (make) -> Void in
            make.top.equalTo(padding.top)
            make.right.equalTo(padding.right)
        }
        
        self.author.snp_makeConstraints{ (make) -> Void in
            make.left.equalTo(self.avatar.snp_right)
            make.top.equalTo(padding.top)
        }
        
        self.body.snp_makeConstraints{ (make) -> Void in
            make.left.equalTo(self.avatar.snp_right)
            make.right.equalTo(-5)
        }

        
    }
    
    func bind(reply: Reply){
        self.author.text = reply.user?.name
        self.avatar.setImageWithURL(NSURL(string: reply.user!.avatar_url!))
        self.createdAt.text = reply.createdAtAgo()
        self.body.text = reply.body
    }


    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
