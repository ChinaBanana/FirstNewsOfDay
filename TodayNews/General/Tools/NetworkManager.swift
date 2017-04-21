//
//  NetworkManager.swift
//  TodayNews
//
//  Created by Coco Wu on 2017/4/17.
//  Copyright © 2017年 cyt. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class NetworkManager: NSObject {
    
    static let shareManager = NetworkManager()
    
    /// _ finished:(_ homeList:[HomeNewsModel])
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
    
    class func requestHomeListOfCategary(_ category:String, finished:@escaping (_ list: [HomeNewsModel]) -> ()) -> (){
        let parame:Dictionary = ["device_id":device_id,
                                 "category": category,
                                 "iid": IID,]
        Alamofire.request(urlBase + urlHomeList, parameters: parame).validate(statusCode: 200...300).responseJSON { (response) in
            debugPrint(response)
        }
    }
    
    
    
    func url(_ subUrl:String) -> String {
        return urlBase + subUrl
    }
}
