//
//  TopicCell.swift
//  ruby-china-swift
//
//  Created by kaka on 16/1/28.
//  Copyright © 2016年 kaka. All rights reserved.
//
//import UIKit
//import SnapKit
//
//class TopicCell: UITableViewCell {
//    
//    var titleLabel: UILabel = UILabel()
//    var bodyLabel: UILabel = UILabel()
//    var avatar: UIImageView = UIImageView()
//    var author: UILabel = UILabel()
//    var create_at: UILabel = UILabel()
//    
//    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        
//        self.contentView.addSubview(self.titleLabel)
//        self.contentView.addSubview(self.bodyLabel)
//        self.contentView.addSubview(self.avatar)
//        self.contentView.addSubview(self.author)
//        self.contentView.addSubview(self.create_at)
//        
//        // 标题
//        self.titleLabel.numberOfLines = 0
//        self.titleLabel.textColor = UIColor(rgba: "#333")
//        self.titleLabel.font = UIFont.systemFontOfSize(15)
//        // 头像
//        self.avatar.multipleTouchEnabled = true
//        self.avatar.userInteractionEnabled = true
//        self.avatar.layer.masksToBounds = true
//        self.avatar.layer.cornerRadius = 5
//        // 作者
//        self.author.textColor = Theme.color.title()
//        self.author.font = UIFont.boldSystemFontOfSize(15)
//        // 日期
//        self.create_at.textColor = UIColor.grayColor()
//        self.create_at.font = UIFont.systemFontOfSize(12)
//        
//        // top -> left -> bottom -> right
//        let padding: UIEdgeInsets = UIEdgeInsetsMake(8, 8, 8, 8)
//        
//        self.avatar.snp_makeConstraints { (make) -> Void in
//            make.top.equalTo(padding.top)
//            make.left.equalTo(padding.left)
//            make.width.equalTo(45)
//            make.height.equalTo(45)
//        }
//        self.titleLabel.snp_makeConstraints { (make) -> Void in
//            make.top.equalTo(self.author.snp_bottom).inset(-5)
//            make.left.equalTo(self.avatar.snp_right).inset(-8)
//            make.right.equalTo(-padding.right)
//        }
//        self.author.snp_makeConstraints { (make) -> Void in
//            make.top.equalTo(padding.top)
//            make.left.equalTo(self.avatar.snp_right).inset(-5)
//        }
//        self.create_at.snp_makeConstraints { (make) -> Void in
//            make.right.equalTo(-padding.right)
//            make.centerY.equalTo(self.author)
//        }
//        self.contentView.snp_makeConstraints { (make) -> Void in
//            make.edges.equalTo(self)
//            make.bottom.equalTo(self.titleLabel.snp_bottom).inset(-padding.bottom)
//        }
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    func bind(data: Topic) -> CGFloat {
//        let dateFormatter = NSDateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZ"
//        let createAt = dateFormatter.dateFromString(data.create_at!)
//        
//        self.titleLabel.text = data.title
//        self.author.text = data.author?.loginname
//        self.create_at.text = createAt?.timeAgoSinceNow()
//        self.avatar.sd_setImageWithURL(NSURL(string: data.author!.avatar_url!))
//        self.setNeedsLayout()
//        return 0
//    }
//    
//}
