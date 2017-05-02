//
//  ImageModel.swift
//  TodayNews
//
//  Created by Coco Wu on 2017/4/24.
//  Copyright © 2017年 cyt. All rights reserved.
//

import UIKit

class ImageModel: BaseModel {
    var height:Int?
    var width:Int?
    
    var url:String?
    var uri:String?
    
    override init() {
        super.init()
        self.url = "http://p3.pstatp.com/list/300x196/1dbb00035732fadd366f"
    }
    
    override init(_ dic: Dictionary<String, Any>) {
        super.init(dic)
        height = dic["height"] as? Int
        width = dic["width"] as? Int
        if let urlString = dic["url"] as? String {
            if urlString.hasSuffix(".webp") {
                let range = urlString.range(of: ".webp")
                url = urlString.substring(to: range!.lowerBound)
            } else {
                url = urlString
            }
        }
    }
    
    class func modelArrOfDicArr(_ dicArr: Array<Dictionary<String, Any>>) -> (Array<ImageModel>) {
        var modelArr = [ImageModel]()
        for itemDic in dicArr {
            modelArr.append(ImageModel.init(itemDic))
        }
        return modelArr
    }
}
