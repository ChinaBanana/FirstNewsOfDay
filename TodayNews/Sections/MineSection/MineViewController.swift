//
//  MineViewController.swift
//  TodayNews
//
//  Created by Coco Wu on 2017/4/17.
//  Copyright © 2017年 cyt. All rights reserved.
//

import UIKit

class MineViewController: BaseTableViewController {

    let cellIdentifer:String = "mineCellIdentifer"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifer)
        self.tableView.tableHeaderView = tableTitleView
        self.tableView.contentInset = UIEdgeInsets.init(top: -22, left: 0, bottom: 0, right: 0)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifer, for: indexPath)
        cell.textLabel?.text = "Mine section:\(indexPath.section) row:\(indexPath.row)"
        return cell
    }
    
    @objc fileprivate func logInBtnClicked(_ sender:UIButton) -> () {
        let logInCon = LogInViewController()
        UIApplication.shared.keyWindow?.rootViewController?.present(logInCon, animated: true, completion: { 
            
        })
    }

    lazy var tableTitleView:UIView = {
        let view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: screen_width, height: 180))
        view.backgroundColor = UIColor.black
        view.alpha = 0.8
        let logInBtn = UIButton.init(frame: CGRect.init(x: 0, y: 130, width: screen_width, height: 50))
        logInBtn.addTarget(self, action: #selector(logInBtnClicked), for: UIControlEvents.touchUpInside)
        logInBtn.setTitle("更多登录方式", for: UIControlState.normal)
        view.addSubview(logInBtn)
        return view
    }()

}
