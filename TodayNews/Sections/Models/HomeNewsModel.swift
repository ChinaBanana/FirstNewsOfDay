//
//  HomeNewsModel.swift
//  TodayNews
//
//  Created by Coco Wu on 2017/4/20.
//  Copyright © 2017年 cyt. All rights reserved.
//

import UIKit

class HomeNewsModel: BaseModel {
    var media_name:String?
    var abstract:String?
    var article_url:String?
    var source:String?
    var web_url:String?
    
    var read_count:Int?
    var ban_comment:Int?
    var ban_bury:Int?
    var comment_count:Int?
    
    var image_list:Array<String>?
    
    var has_mp4_video:Bool?
    
    
    override init(_ dic:Dictionary<String, Any>) {
        super.init(dic)
    }
}
