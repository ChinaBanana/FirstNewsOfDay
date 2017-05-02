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
    var display_url:String?
    var keywords:String?
    var share_url:String?
    var source_open_url:String?
    var tag:String?
    var title:String?
    var url:String?
    
    var read_count:Int?
    var ban_comment:Int?
    var ban_bury:Int?
    var comment_count:Int?
    var aggr_type:Int?
    var article_sub_type:Int?
    var article_type:Int?
    var behot_time:Int?
    var bury_count:Int?
    var cell_flag:Int?
    var cell_layout_style:Int?
    var cell_type:Int?
    var cursor:Int?
    var digg_count:Int?
    var gallary_image_count:Int?
    var group_id:Int?
    var ignore_web_transform:Int?
    var item_id:Int?
    var item_varsion:Int?
    var level:Int?
    var publish_time:Int?
    var repin_count:Int?
    var share_count:Int?
    var source_icon_style:Int?
    var tag_id:Int?
    
    var action_list:Array<Dictionary<String, Any>>?
    var filter_words:Array<Dictionary<String, Any>>?
    var large_image_list:Array<Dictionary<String,Any>>?
    
    
    var media_info:Dictionary<String,Any>?
    var user_info:Dictionary<String,Any>?
    
    var middle_image:ImageModel?
    var image_list:Array<ImageModel>?
    
    var has_mp4_video:Bool?
    var has_image:Bool?
    var has_m3u8_video:Bool?
    var has_video:Bool?
    var hot:Bool?
    var is_subject:Bool?
    var show_portrait:Bool?
    var show_portrait_article:Bool?
    
    override init() {
        super.init()
        let titleArr:NSArray = ["swift 学习","swift 学习问题亟待解决，速度papapa，键盘敲起来","swift 学习问题亟待解决，速度papapa，键盘敲起来lailailai"]
        let num = arc4random()
        self.title = titleArr[Int(num) % 3] as? String
        self.image_list = [ImageModel(),ImageModel(),ImageModel()]
    }
    
    override init(_ dic:Dictionary<String, Any>) {
        super.init(dic)
        
        let imageArr:Array<Dictionary<String, Any>>? = dic["image_list"] as? Array
        let middleImageDic:Dictionary<String, Any>? = dic["middle_image"] as? Dictionary
        
        image_list = ImageModel.modelArrOfDicArr(imageArr!)
        middle_image = ImageModel.init(middleImageDic!)
        
        read_count = dic["read_count"] as? Int
        ban_comment = dic["ban_comment"] as? Int
        ban_bury = dic["comment_count"] as? Int
        comment_count = dic[""] as? Int
        aggr_type = dic["aggr_type"] as? Int
        article_sub_type = dic["article_sub_type"] as? Int
        article_type = dic["article_type"] as? Int
        behot_time = dic["behot_time"] as? Int
        bury_count = dic["bury_count"] as? Int
        cell_flag = dic["cell_flag"] as? Int
        cell_layout_style = dic["cell_layout_style"] as? Int
        cell_type = dic["cell_type"] as? Int
        cursor = dic["cursor"] as? Int
        digg_count = dic["digg_count"] as? Int
        gallary_image_count = dic["gallary_image_count"] as? Int
        group_id = dic["group_id"] as? Int
        ignore_web_transform = dic["ignore_web_transform"] as? Int
        item_id = dic["item_id"] as? Int
        item_varsion = dic["item_varsion"] as? Int
        level = dic["level"] as? Int
        publish_time = dic["publish_time"] as? Int
        repin_count = dic["repin_count"] as? Int
        share_count = dic["share_count"] as? Int
        source_icon_style = dic["source_icon_style"] as? Int
        tag_id = dic["tag_id"] as? Int
        
        has_image = dic["has_image"] as? Bool
        has_video = dic["has_video"] as? Bool
        has_mp4_video = dic["has_mp4_video"] as? Bool
        has_image = dic["has_image"] as? Bool
        has_m3u8_video = dic["has_m3u8_video"] as? Bool
        has_video = dic["has_video"] as? Bool
        hot = dic["hot"] as? Bool
        is_subject = dic["is_subject"] as? Bool
        show_portrait = dic["show_portrait"] as? Bool
        show_portrait_article = dic["show_portrait_article"] as? Bool
    }
}
