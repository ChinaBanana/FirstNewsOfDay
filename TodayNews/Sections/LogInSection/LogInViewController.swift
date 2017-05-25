//
//  LogInViewController.swift
//  TodayNews
//
//  Created by Coco Wu on 2017/5/23.
//  Copyright © 2017年 cyt. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LogInViewController: BaseViewController {
    
    let logInService = LogInService.init()
    
    let viewModel = LogInViewModel()
    let disposeBag = DisposeBag()
    let loadingView = UIActivityIndicatorView.init(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// 绑定订阅结果，此处应该有更优雅的方法
        viewModel.logInResultSubject.subscribe { (event) in
            // 登录成功后dismiss ViewController
            self.loadingView.stopAnimating()
            self.dismissBtnClicked(self.dismissBtn)
        }.addDisposableTo(disposeBag)
        
        
        self.loadingView.center = backView.center
        self.view.backgroundColor = UIColor.black
        self.view.addSubview(backView)
        self.view.addSubview(self.loadingView)
        self.backView.addSubview(dismissBtn)
        self.backView.addSubview(titleLabel)
        self.backView.addSubview(accountView)
        self.backView.addSubview(verifyView)
        self.backView.addSubview(logInButton)
        self.accountView.addSubview(accountTF)
        self.verifyView.addSubview(verifyCodeTF)
        self.updateViewConstraints()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc fileprivate func dismissBtnClicked(_ sender:UIButton) -> (){
        self.dismiss(animated: true) { 
            
        }
    }
    
    @objc fileprivate func logInBtnClickec(_ sender:UIButton) -> (){
        self.loadingView.startAnimating()
        /// 通过viewmodel发送请求
        self.viewModel.logIn(self.accountTF.text!, self.verifyCodeTF.text!)
    }
    
    /// 布局
    override func updateViewConstraints() {
        
        titleLabel.snp.makeConstraints { (make) in
            make.leading.trailing.equalTo(0)
            make.top.height.equalTo(50)
        }
        
        accountView.snp.makeConstraints { (make) in
            make.leading.equalTo(25)
            make.trailing.equalTo(-25)
            make.height.equalTo(50)
            make.top.equalTo(titleLabel.snp.bottom).offset(30)
        }
        
        accountTF.snp.makeConstraints { (make) in
            make.leading.equalTo(25)
            make.top.bottom.equalTo(0)
            make.width.equalTo(200)
        }
        
        verifyView.snp.makeConstraints { (make) in
            make.size.leading.equalTo(accountView)
            make.top.equalTo(accountView.snp.bottom).offset(25)
        }
        
        verifyCodeTF.snp.makeConstraints { (make) in
            make.leading.equalTo(25)
            make.top.bottom.equalTo(0)
            make.width.equalTo(200)
        }
        
        logInButton.snp.makeConstraints { (make) in
            make.size.leading.equalTo(accountView)
            make.top.equalTo(verifyView.snp.bottom).offset(25)
        }
        
        super.updateViewConstraints()
    }
    
    /// MARK 懒加载
    lazy var dismissBtn:UIButton = {
        let button = UIButton.init(frame: CGRect.init(x: screen_width - 40, y: 10, width: 35, height: 35))
        button.backgroundColor = UIColor.red
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(dismissBtnClicked(_:)), for: UIControlEvents.touchUpInside)
        return button
    }()
    
    lazy var backView:UIView = {
        let view = UIView.init(frame: CGRect.init(x: 0, y: 44, width: screen_width, height: screen_height - 44))
        view.backgroundColor = RGBColor(245, g: 245, b: 245, a: 1)
        view.layer.cornerRadius = 3;
        return view
    }()
    
    lazy var titleLabel:UILabel = {
        let label = UILabel.init()
        label.text = "登录你的头条，精彩永不丢失"
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont.systemFont(ofSize: 22)
        return label
    }()
    
    lazy var accountView:UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 25
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        return view
    }()
    
    lazy var accountTF:UITextField = {
        let textField = UITextField.init()
        textField.placeholder = "手机号"
        return textField
    }()
    
    lazy var verifyCodeTF:UITextField = {
        let textField = UITextField.init()
        textField.placeholder = "请输入验证码"
        return textField
    }()
    
    lazy var verifyView:UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 25
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        return view
    }()
    
    lazy var logInButton:UIButton = {
        let view = UIButton.init()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 25
        view.backgroundColor = RGBColor(246, g: 150, b: 150, a: 1)
        view.setTitle("进入头条", for: UIControlState.normal)
        view.addTarget(self , action: #selector(logInBtnClickec(_:)), for: UIControlEvents.touchUpInside)
        return view
    }()
}
