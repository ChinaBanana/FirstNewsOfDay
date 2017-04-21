//
//  BaseModel.swift
//  TodayNews
//
//  Created by Coco Wu on 2017/4/20.
//  Copyright © 2017年 cyt. All rights reserved.
//

import UIKit

class BaseModel: BaseObject {
    
    override init() {
        super.init()
    }
    
    init(_ dic:Dictionary<String, Any>) {
        super.init()
        let arr = self.getProperties()
        for property:String in arr {
            self.setValue(dic[property], forKey: property)
        }
    }
    
    func instanceType() -> (String?) {
        return nil
    }
    
    /// 字典数组转模型数组
    func modelArrOfDicArr(_ dicArr:Array<Dictionary<String, Any>>) -> (Array<BaseModel>){
        
        return [BaseModel]()
    }
}
