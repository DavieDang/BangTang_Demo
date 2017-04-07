//
//  BTTabBarController.swift
//  BangTang_Demo
//
//  Created by admin on 2017/4/6.
//  Copyright © 2017年 com.gz.bingoMobileSchools. All rights reserved.
//

import UIKit

class BTTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let tabBar = UITabBar.appearance()
        tabBar.tintColor = UIColor.lightGray
        
        
        self.addChileViewController()
        // Do any additional setup after loading the view.
    }

    
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /// 添加子控制器
    private func addChileViewController(){
        
        self.addChildViewController(childController: BTBanTangViewController(), title: "半塘", ImageName: "TabBar_home_23x23_")
        self.addChildViewController(childController: BTDanPinViewController(), title: "单品", ImageName: "TabBar_gift_23x23_")
        self.addChildViewController(childController: BTClassifyViewController(), title: "分类", ImageName: "TabBar_category_23x23_")
        self.addChildViewController(childController: BTMeViewController(), title: "我", ImageName: "TabBar_me_boy_23x23_")
    }
    
    
    
    /// 重载方法
    ///
    /// - Parameters:
    ///   - childController: 子控制器
    ///   - title: 标题
    ///   - ImageName: 图片名字
    private func addChildViewController(childController: UIViewController,title:String,ImageName:String) {
        
        let navC = UINavigationController(rootViewController: childController)
        navC.tabBarItem.image = UIImage.init(named: ImageName)
        navC.tabBarItem.selectedImage = UIImage.init(named: ImageName + "selected")
        navC.title = title
        self.addChildViewController(navC)
        
    }
    
    


}
