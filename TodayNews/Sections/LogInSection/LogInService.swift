//
//  LogInService.swift
//  TodayNews
//
//  Created by Coco Wu on 2017/5/23.
//  Copyright © 2017年 cyt. All rights reserved.
//

import UIKit
import RxSwift

class LogInService: BaseObject {

    let disposeBag = DisposeBag()
    
    /*
     * 目前有三种思路，三种种方法均可实现，根据需要确定
     * 1. 将Service实例化，建立单例，通过单例的subject发送事件
     * 2. Static 修饰subject，同样是单例
     * 3. 抽象出一个中继器，所有的命令都通过中继器来发送和接收，在中继器中fliter所需要的事件类型，比较适用于大型项目
     */
    
    // static let shareInstance = LogInService.init()
    
    static let logInResultSubject = PublishSubject<LogInResult>()
    
    override init() {
        super.init()
        
        /// 定于viewModel的请求
        LogInViewModel.logInSubject.subscribe(onNext: { (model) in
            /// 收到请求后进行登录
            self.login(model)
        }, onError: { (error) in
            debugPrint("on error \(error.localizedDescription)")
        }, onCompleted: { 
            debugPrint("loginSubject completed")
        }) { 
            debugPrint("loginsubject disposed")
        }.addDisposableTo(disposeBag)
    }
    
    fileprivate func login(_ loginModel:LogInModel) -> (){
        /// 模拟网络请求，1s后请求成功
        debugPrint("wait 1 second")
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            
            /// 登录成功或失败，发送登录结果事件
            LogInService.logInResultSubject.onNext(LogInResult.init(result: true, message: "logInSucceed"))
            debugPrint("1 second later")
            debugPrint("logInSucceed:\(loginModel.account),\(loginModel.password)")
        }
    }
}
