//
//  HomeViewController.swift
//  TodayNews
//
//  Created by Coco Wu on 2017/4/17.
//  Copyright © 2017年 cyt. All rights reserved.
//

import UIKit

class HomeViewController: BaseTableViewController {

    let mainIdentifer:String = "picsCellIdentifer"
    let textIdentifer:String = "pureTextCellIdentifer"
    let adPicIdentifer:String = "adPicCellIdentifer"
    
    var dataArray:Array = [HomeNewsModel]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        NetworkManager.requestHomeCategraies({ modelArr in
            debugPrint(modelArr)
        })
        
        NetworkManager.requestHomeListOfCategary("news_hot") { modelArr in
            self.dataArray.append(contentsOf: modelArr)
            self.tableView.reloadData()
        }
        
        //self.tableView.rowHeight = UITableViewAutomaticDimension
        //self.tableView.estimatedRowHeight = 170
        
        self.tableView.register(HomePicsCell.self, forCellReuseIdentifier:mainIdentifer)
        self.tableView.fd_debugLogEnabled = true
        //self.tableView.register(HomePureTextCell.self, forCellReuseIdentifier:textIdentifer)
        //self.tableView.register(HomeADPicCell.self, forCellReuseIdentifier: adPicIdentifer)
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model:HomeNewsModel = self.dataArray[indexPath.row]
        let cell:HomePicsCell = tableView.dequeueReusableCell(withIdentifier: mainIdentifer, for: indexPath) as! HomePicsCell
        cell.configCellContentWith(model)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
//        return tableView.fd_heightForCell(with: mainIdentifer, cacheBy: indexPath, configuration: { (cell) in
//            let homeCell = cell as! HomePicsCell
//            homeCell.configCellContentWith(self.dataArray[indexPath.row])
//        })
    }
    
    lazy var testArray:NSArray = {
        var modelArr = [HomeNewsModel]()
        for index in 0...5{
            modelArr.append(HomeNewsModel())
        }
        return modelArr as NSArray
    }()
}
