//
//  Marco.swift
//  TodayNews
//
//  Created by Coco Wu on 2017/4/17.
//  Copyright © 2017年 cyt. All rights reserved.
//

import UIKit

let IID: String = "5034850950"
let device_id: String = "6096495334"
let urlBase:String = "https://lf.snssdk.com/"
let urlHomeCategraies:String = "article/category/get_subscribed/v1/?"
let urlHomeList:String = "api/news/feed/v39/?"


let screen_width:CGFloat = UIScreen.main.bounds.size.width
let screen_height:CGFloat = UIScreen.main.bounds.size.height

func main_color() -> (UIColor){
    return RGBColor(206, g: 30, b: 30, a: 1)
}

func RGBColor(_ r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
    return UIColor.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
}
