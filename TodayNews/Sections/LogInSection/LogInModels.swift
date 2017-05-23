//
//  LogInModels.swift
//  TodayNews
//
//  Created by Coco Wu on 2017/5/23.
//  Copyright © 2017年 cyt. All rights reserved.
//

import Foundation
import RxSwift

struct LogInResult {
    let result:Bool
    let message:String
}

struct LogInModel {
    let account:String
    let password:String
}

