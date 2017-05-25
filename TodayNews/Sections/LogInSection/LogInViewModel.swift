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

typealias GetResultClosure = (LogInResult) -> ()

class LogInViewModel {
    
    let disposeBag = DisposeBag()
    //let service = LogInService.shareInstance
    /// 通过闭包来binding登录结果
    var resultClosure:GetResultClosure?
    
    /// 或者通过Subject来发送登录结果，相对而言，貌似闭包更优雅一些
    //let logInResultSubject = PublishSubject<LogInResult>()
    //let loginDriver:Driver<LogInResult>
    
    static let logInSubject = PublishSubject<LogInModel>()
    
    init() {
        /// 订阅登录结果
        LogInService.logInResultSubject.subscribe(onNext: { (resultModel) in
            self.resultClosure!(resultModel)
        }, onError: { (error) in
            
        }, onCompleted: { 
            
        }) { 
            
        }.addDisposableTo(disposeBag)
    }

    func logIn(_ account:String, _ password:String, _ handler:@escaping GetResultClosure) -> () {
        debugPrint("\(account) \(password)")
        
        /// 向service发送登录请求
        LogInViewModel.logInSubject.onNext(LogInModel.init(account: account, password: password))
        self.resultClosure = handler
    }
}
