//
//  LogInViewModel.swift
//  TodayNews
//
//  Created by Coco Wu on 2017/5/23.
//  Copyright © 2017年 cyt. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LogInViewModel {
    
    let disposeBag = DisposeBag()
    let logInResultSubject = PublishSubject<LogInResult>()
    
    //let loginDriver:Driver<LogInResult>
    
    static let logInSubject = PublishSubject<LogInModel>()
    
    
    init() {
        /// 订阅登录结果
        LogInService.logInResultSubject.subscribe(onNext: { (resultModel) in
            self.logInResultSubject.onNext(resultModel)
        }, onError: { (error) in
            
        }, onCompleted: { 
            
        }) { 
            
        }.addDisposableTo(disposeBag)
    }

    func logIn(_ account:String, _ password:String) -> () {
        debugPrint("\(account) \(password)")
        
        /// 向service发送登录请求
        LogInViewModel.logInSubject.onNext(LogInModel.init(account: account, password: password))
    }
}
