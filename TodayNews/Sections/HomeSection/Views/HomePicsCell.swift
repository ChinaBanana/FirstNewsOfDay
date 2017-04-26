//
//  HomePicsCell.swift
//  TodayNews
//
//  Created by Coco Wu on 2017/4/21.
//  Copyright © 2017年 cyt. All rights reserved.
//

import UIKit

let imageWidth:CGFloat = (screen_width - 32) / 3

class HomePicsCell: BaseTableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = UITableViewCellSelectionStyle.none
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
        let size = CGSize.init(width: screen_width - 40, height: screen_height)
        let dic:Dictionary<String, NSObject> = [NSFontAttributeName:titleLabel.font]
        let title_size = model.title!.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dic, context: nil).size
        
        titleLabel.snp.updateConstraints { (make) in
            make.height.equalTo(title_size.height)
        }
        
        titleLabel.text = model.title
        debugPrint(model.image_list ?? "No image list")
        if (model.image_list?.count)! > 0 {
            let leftImage:ImageModel? = model.image_list?.first
            let centerImage:ImageModel? = model.image_list?[1]
            let rightImage:ImageModel? = model.image_list?[2]
            
            leftImageView.kf.setImage(with:URL.init(string: (leftImage?.url)!))
            centerImageView.kf.setImage(with: URL.init(string: (centerImage?.url)!))
            rightImageView.kf.setImage(with: URL.init(string: (rightImage?.url)!))
        }else{
            leftImageView.image = nil
            centerImageView.image = nil
            rightImageView.image = nil
        }
    }
    
    override func updateConstraints() {
        
        titleLabel.snp.makeConstraints { (make) in
            make.left.top.equalTo(10)
            make.right.equalTo(-10)
            make.height.equalTo(30)
        }
        
        leftImageView.snp.makeConstraints { (make) in
            make.left.equalTo(titleLabel.snp.left)
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.width.equalTo(imageWidth)
            make.height.equalTo(75)
        }
        
        centerImageView.snp.makeConstraints { (make) in
            make.width.height.equalTo(leftImageView)
            make.centerX.equalTo(self.contentView)
            make.centerY.equalTo(leftImageView)
        }
        
        rightImageView.snp.makeConstraints { (make) in
            make.width.height.equalTo(leftImageView)
            make.centerY.equalTo(leftImageView)
            make.right.equalTo(self.contentView).offset(-10)
        }
        super.updateConstraints()
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
