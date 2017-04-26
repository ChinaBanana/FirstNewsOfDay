//
//  HomeCategraiesModel.swift
//  TodayNews
//
//  Created by Coco Wu on 2017/4/21.
//  Copyright © 2017年 cyt. All rights reserved.
//

import UIKit

class HomeCategraiesModel: BaseModel {
    var category:String?
    var concern_id:String?
    var icon_url:String?
    var name:String?
    var web_url:String?
    
    var default_add:Int?
    var flages:Int?
    var tip_new:Int?
    var type:Int?
    
    override init(_ dic:Dictionary<String, Any>) {
        super.init(dic)
        self.default_add = dic["default_add"] as? Int
        self.flages = dic["flages"] as? Int
        self.tip_new = dic["tip_new"] as? Int
        self.type = dic["type"] as? Int
    }
}
