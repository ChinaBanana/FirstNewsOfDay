//
//  HomePicsCell.swift
//  TodayNews
//
//  Created by Coco Wu on 2017/4/21.
//  Copyright © 2017年 cyt. All rights reserved.
//

import UIKit

let imageWidth:CGFloat = (screen_width - 32) / 3

class HomePicsCell: BaseTableViewCell{
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = UITableViewCellSelectionStyle.none
        self.fd_usingFrameLayout = true
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(leftImageView)
        self.contentView.addSubview(centerImageView)
        self.contentView.addSubview(rightImageView)
        self.updateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configCellContentWith(_ model:HomeNewsModel) -> () {
        titleLabel.text = model.title
       
        leftImageView.image = nil
        centerImageView.image = nil
        rightImageView.image = nil
        if (model.image_list?.count)! > 0 {
            let leftImage:ImageModel? = model.image_list?.first
            let centerImage:ImageModel? = model.image_list?[1]
            let rightImage:ImageModel? = model.image_list?[2]
            
            leftImageView.kf.setImage(with:URL.init(string: (leftImage?.url)!))
            centerImageView.kf.setImage(with: URL.init(string: (centerImage?.url)!))
            rightImageView.kf.setImage(with: URL.init(string: (rightImage?.url)!))
        }
    }
    
    override func updateConstraints() {
        
        titleLabel.snp.makeConstraints { (make) in
            make.left.top.equalTo(10)
            make.right.equalTo(-10)
        }
        
        leftImageView.snp.makeConstraints { (make) in
            make.left.equalTo(titleLabel)
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.width.equalTo(imageWidth)
            make.height.equalTo(75)
        }
        
        centerImageView.snp.makeConstraints { (make) in
            make.size.equalTo(leftImageView)
            make.centerX.equalTo(self.contentView)
            make.top.equalTo(leftImageView)
        }
        
        rightImageView.snp.makeConstraints { (make) in
            make.size.equalTo(leftImageView)
            make.top.equalTo(leftImageView)
            make.right.equalTo(-10)
        }
        
        super.updateConstraints()
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        var totalHeight:CGFloat = 0
        totalHeight += titleLabel.sizeThatFits(size).height // 需要帮我计算出title的高度使用这个方法
        totalHeight += 75 // 自定义高度，直接+
        totalHeight += 30 // margin
        return CGSize.init(width: size.width, height: totalHeight)
    }
    
    lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        return label
    }()
    
    lazy var leftImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = main_color()
        return imageView;
    }()
    
    lazy var centerImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.center = CGPoint.init(x: screen_width / 2, y: imageView.center.y)
        imageView.backgroundColor = main_color()
        return imageView;
    }()
    
    lazy var rightImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = main_color()
        return imageView;
    }()
}
