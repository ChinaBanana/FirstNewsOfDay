//
//  TNTabBarController.swift
//  TodayNews
//
//  Created by Coco Wu on 2017/4/17.
//  Copyright © 2017年 cyt. All rights reserved.
//

import UIKit

class TNTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initChildViewControllers()
        // Do any additional setup after loading the view.
    }
    
    func initChildViewControllers() -> () {
        addChildViewCon(HomeViewController(), title: "首页", imageName: "tabbar_home", selectedImage: "tabbar_home_selected")
        addChildViewCon(VideoViewController(), title: "视频", imageName: "tabbar_video", selectedImage: "tabbar_video_selected")
        addChildViewCon(FocusViewController(), title: "关注", imageName: "tabbar_focus", selectedImage: "tabbar_focus_selected")
        addChildViewCon(MineViewController(), title: "我", imageName: "tabbar_mine", selectedImage: "tabbar_mine_selected")
    }

    func addChildViewCon(_ viewCon:UIViewController, title:String, imageName:String, selectedImage:String) -> () {
        let navieCon = TNNavigationController.init(rootViewController: viewCon)
        navieCon.tabBarItem = UITabBarItem.init(title: title, image: UIImage.init(named: imageName)?.withRenderingMode(UIImageRenderingMode.alwaysOriginal),selectedImage: UIImage.init(named: selectedImage)?.withRenderingMode(UIImageRenderingMode.alwaysOriginal))
        self.addChildViewController(navieCon)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
