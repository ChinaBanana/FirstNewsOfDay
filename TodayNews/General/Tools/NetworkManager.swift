//
//  NetworkManager.swift
//  TodayNews
//
//  Created by Coco Wu on 2017/4/17.
//  Copyright © 2017 cyt. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class NetworkManager: NSObject {
    
    static let shareManager = NetworkManager()
    
    /// 获取首页分类列表
    ///
    /// - Parameter finished: 函数，回调数组
    class func requestHomeCategraies(_ finished:@escaping (_ :[HomeCategraiesModel]) -> ()) -> () {
        
        let parame:Dictionary = ["device_id": device_id,
                                 "aid": 13,
                                 "iid": IID] as [String : Any]
        
        Alamofire.request(urlBase + urlHomeCategraies, parameters: parame).validate(statusCode: 200...300).responseJSON { (response) in
            if let dataValue = response.result.value{
                let dicRoot = JSON(dataValue)
                let dataDic = dicRoot["data"].dictionary
                let dataArr = dataDic?["data"]?.arrayObject
                
                var modelArr = [HomeCategraiesModel]()
                for elem in dataArr!{
                    modelArr.append(HomeCategraiesModel.init(elem as! Dictionary<String, Any>))
                }
                finished(modelArr)
            }
        }
    }
    
    
    /// 首页根据类型来获取列表
    ///
    /// - Parameters:
    ///   - category: 类别
    ///   - finished: 操作函数，回调model数组
    class func requestHomeListOfCategary(_ category:String, finished:@escaping (_ list: [HomeNewsModel]) -> ()) -> (){
        let parame:Dictionary<String, Any> = ["device_id":device_id,
                                              "category": category,
                                              "iid": IID,
                                              "last_refresh_sub_entrance_interval": Date().timeIntervalSinceNow]
        Alamofire.request(urlBase + urlHomeList, parameters: parame).validate(statusCode: 200...300).responseJSON { (response) in
            if let dataValue = response.result.value{
                let dicRoot = JSON(dataValue)
                let dataArr:Array = dicRoot["data"].arrayObject!
                var modelArr = [HomeNewsModel]()
                for elem in dataArr{
                    let item : Dictionary<String, Any> = elem as! Dictionary<String, Any>
                    let content = item["content"] as? String ?? "value is nil"
                    modelArr.append(HomeNewsModel.init(shareManager.stringToDic(content) as! Dictionary<String, Any>))
                }
                finished(modelArr)
            }
        }
    }
    
    func stringToDic(_ convertStr:String) -> NSDictionary {
        let data:Data = convertStr.data(using: String.Encoding.utf8)!
        let contentDic = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)
        return contentDic as! NSDictionary
    }
}
