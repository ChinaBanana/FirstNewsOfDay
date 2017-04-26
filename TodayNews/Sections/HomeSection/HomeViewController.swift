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
            
        })
        
        NetworkManager.requestHomeListOfCategary("news_hot") { modelArr in
            /// debugPrint(modelArr)
            self.dataArray.append(contentsOf: modelArr)
            self.tableView.reloadData()
        }
        
        self.tableView.register(HomePicsCell.self, forCellReuseIdentifier:mainIdentifer)
        self.tableView.register(HomePureTextCell.self, forCellReuseIdentifier:textIdentifer)
        self.tableView.register(HomeADPicCell.self, forCellReuseIdentifier: adPicIdentifer)
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
    }
}
