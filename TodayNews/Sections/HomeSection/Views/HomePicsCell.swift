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
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var titleLabel : UILabel = {
        let label = UILabel.init(frame: CGRect.init(x: 10, y: 12, width: screen_width - 20, height: 50))
        label.numberOfLines = 2
        label.text = "土豆别炒丝了，这种做法比土豆丝好吃百倍，你试试！"
        return label
    }()
    
    lazy var leftImageView : UIImageView = {
        let imageView = UIImageView.init(frame: CGRect.init(x: 10, y: 62, width: imageWidth, height: 75))
        imageView.backgroundColor = UIColor.purple
        return imageView;
    }()
    
    lazy var centerImageView : UIImageView = {
        let imageView = UIImageView.init(frame: CGRect.init(x: 0, y: 62, width: imageWidth, height: 75))
        imageView.center = CGPoint.init(x: screen_width / 2, y: imageView.center.y)
        imageView.backgroundColor = UIColor.purple
        return imageView;
    }()
    
    lazy var rightImageView : UIImageView = {
        let imageView = UIImageView.init(frame: CGRect.init(x: screen_width - 10 - imageWidth, y: 62, width: imageWidth, height: 75))
        imageView.backgroundColor = UIColor.purple
        return imageView;
    }()
}
