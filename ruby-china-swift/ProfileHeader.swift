//
//  ProfileHeader.swift
//  ruby-china-swift
//
//  Created by kaka on 16/3/19.
//  Copyright © 2016年 kaka. All rights reserved.
//

import UIKit

class ProfileHeader: UIView{
    
    var avatar: UIImageView = UIImageView()
    var name: UILabel = UILabel()
    var profile: UILabel = UILabel()
    var edit: UIButton = UIButton(frame: CGRectMake(0, 0, 0, 0))
    var homepage: UILabel = UILabel()
    var topicType: UISegmentedControl = UISegmentedControl()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.avatar.backgroundColor = UIColor.blueColor()
        self.avatar.multipleTouchEnabled = true
        self.avatar.userInteractionEnabled = true
        self.avatar.layer.masksToBounds = true
        self.avatar.layer.cornerRadius = 5
        self.avatar.layer.borderWidth = 3
        self.avatar.layer.borderColor = UIColor.whiteColor().CGColor
        
        self.name.text = "名字"
        self.name.userInteractionEnabled = true
        self.name.font = UIFont.boldSystemFontOfSize(16)
        
        self.profile.text = "个人资料"
        self.profile.font = UIFont.systemFontOfSize(14)
        
        self.edit.frame = CGRectMake(0, 0, 0, 0)
        self.edit.setTitle("编辑个人资料", forState: UIControlState.Normal)
        self.edit.titleLabel?.font = UIFont.boldSystemFontOfSize(12)
        
        self.homepage.text = "http://168ta.com"
        self.homepage.font = UIFont.systemFontOfSize(14)
        
        self.topicType.insertSegmentWithTitle("帖子", atIndex: 0, animated: true)
        self.topicType.insertSegmentWithTitle("回帖", atIndex: 1, animated: true)
        
        self.addSubview(self.avatar)
        self.addSubview(self.name)
        self.addSubview(self.profile)
        self.addSubview(self.edit)
        self.addSubview(self.homepage)
        self.addSubview(self.topicType)
        
        let padding: UIEdgeInsets = UIEdgeInsetsMake(60, 10, 8, 10)
        self.avatar.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(padding.top)
            make.left.equalTo(padding.left)
            make.width.equalTo(65)
            make.height.equalTo(65)
        }
        self.name.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(padding.left)
            make.top.equalTo(self.avatar.snp_bottom).inset(-5)
        }
        self.profile.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(padding.left)
            make.top.equalTo(self.name.snp_bottom).inset(-5)
        }
        self.edit.snp_makeConstraints { (make) -> Void in
            make.right.equalTo(-padding.right)
            make.width.equalTo(90)
            make.height.equalTo(28)
        }
        
        self.homepage.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.profile.snp_bottom).inset(-5)
        }
        
        self.topicType.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.homepage.snp_bottom).inset(-10)
            make.left.equalTo(padding.left)
            make.right.equalTo(-padding.right)
        }
        
        self.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(self)
            make.bottom.equalTo(self.topicType.snp_bottom).inset(-8)
            make.width.equalTo(UIScreen.mainScreen().bounds.width)
        }
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
