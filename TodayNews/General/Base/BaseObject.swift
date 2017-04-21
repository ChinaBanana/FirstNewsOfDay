//
//  BaseObject.swift
//  TodayNews
//
//  Created by Coco Wu on 2017/4/20.
//  Copyright © 2017年 cyt. All rights reserved.
//

import UIKit

class BaseObject: NSObject {
    
    override init() {
        super.init()
    }
    
    func getProperties() -> (Array<String>) {
        var outCount:UInt32 = 0
        let properties:UnsafeMutablePointer<objc_property_t?>! = class_copyPropertyList(self.classForCoder, &outCount)
        let count:Int = Int(outCount)
        var propertyArr = [String]()
        for index in 0..<count {
            let property:objc_property_t = properties[index]!
            let propertyName:String? = String.init(utf8String: property_getName(property))
            propertyArr.append(propertyName ?? "property is nil")
        }
        return propertyArr
    }
    
    override var description: String{
        var descriptionStr = "\n"
        let arr = self.getProperties()
        for property:String in arr {
            descriptionStr.append(property)
            let value = self.value(forKey: property) ?? " is nil"
            descriptionStr.append(":" + "\(value)" + "\n")
        }
        return descriptionStr
    }
}
