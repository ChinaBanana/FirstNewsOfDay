//
//  HomeViewController.swift
//  TodayNews
//
//  Created by Coco Wu on 2017/4/17.
//  Copyright © 2017年 cyt. All rights reserved.
//

import UIKit
import DGElasticPullToRefresh

class HomeViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    let mainIdentifer:String = "picsCellIdentifer"
    let textIdentifer:String = "pureTextCellIdentifer"
    let adPicIdentifer:String = "adPicCellIdentifer"
    
    var dataArray:Array = [HomeNewsModel]()
    /*
    var set:Array<Any> = ["1"]
    {
        willSet{
            print("will set \(String(describing: set))")
        }
        didSet{
            print("did set \(String(describing: set))")
        }
    }
    */
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        //set = ["how", "are", "U"]
        NetworkManager.requestHomeCategraies({ modelArr in
            //debugPrint(modelArr)
        })
        
        NetworkManager.requestHomeListOfCategary("news_hot") { modelArr in
            self.dataArray.append(contentsOf: modelArr)
            self.tableView.reloadData()
        }
        
        tableView.register(HomePicsCell.self, forCellReuseIdentifier:mainIdentifer)
        tableView.delegate = self;
        tableView.dataSource = self;
        //self.tableView.register(HomePureTextCell.self, forCellReuseIdentifier:textIdentifer)
        //self.tableView.register(HomeADPicCell.self, forCellReuseIdentifier: adPicIdentifer)
        
        tableView.dg_addPullToRefreshWithActionHandler({
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1, execute: { 
                self.tableView.dg_stopLoading()
                print("1s 后的世界")
            })
        }, loadingView: DGElasticPullToRefreshLoadingViewCircle())
        tableView.dg_setPullToRefreshBackgroundColor(main_color())
        tableView.dg_setPullToRefreshFillColor(UIColor.white)
        
        self.view.addSubview(headerView)
        self.view.addSubview(tableView)
        tableView.reloadData()
        
       // let testDelegate = DelegateTest.init()
    }

    /// 移除下拉刷新
    deinit {
        tableView.dg_removePullToRefresh()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.testArray.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model:HomeNewsModel = self.testArray[indexPath.row] as! HomeNewsModel
        //let model:HomeNewsModel = self.dataArray[indexPath.row]
        
        let cell:HomePicsCell = tableView.dequeueReusableCell(withIdentifier: mainIdentifer, for: indexPath) as! HomePicsCell
        cell.configCellContentWith(model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.fd_heightForCell(with: mainIdentifer, cacheBy: indexPath, configuration: { (cell) in
            let homeCell = cell as! HomePicsCell
            homeCell.configCellContentWith(self.testArray[indexPath.row] as! HomeNewsModel)
        })
    }
    
    lazy var tableView:UITableView = {
        let tableView = UITableView.init(frame: CGRect.init(x: 0, y: 104, width: screen_width, height: self.view.bounds.size.height - 40), style: UITableViewStyle.plain)
        return tableView;
    }()
    
    lazy var testArray:NSArray = {
        var modelArr = [HomeNewsModel]()
        for index in 0 ..< 20{
            modelArr.append(HomeNewsModel())
        }
        return modelArr as NSArray
    }()
    
    lazy var headerView:UIScrollView = {
        let view = UIScrollView.init(frame: CGRect.init(x: 0, y: 64, width: screen_width, height: 40))
        view.backgroundColor = UIColor.purple
        return view
    }()
}
