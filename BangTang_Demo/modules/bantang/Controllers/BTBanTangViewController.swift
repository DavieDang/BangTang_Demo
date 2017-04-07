//
//  BTBanTangViewController.swift
//  BangTang_Demo
//
//  Created by admin on 2017/4/6.
//  Copyright © 2017年 com.gz.bingoMobileSchools. All rights reserved.
//

import UIKit





class BTBanTangViewController: UIViewController,UIScrollViewDelegate {

    
    /// 标签
    weak var titlesView = UIView()
    
    //底部红色指示器
    weak var indicatorView = UIView()
    
    //内容视图
    weak var contentView = UIScrollView()
    
    //当前选择的按钮
    weak var selectedButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.view.backgroundColor = UIColor.red
        
        setUpNav()
        
        
        //添加数据
        let vc1  = BTTopTitlesViewController()
        vc1.title = "精选"
        let vc2  = BTTopTitlesViewController()
        vc2.title = "美食"
        let vc3  = BTTopTitlesViewController()
        vc3.title = "家居"
        let vc4  = BTTopTitlesViewController()
        vc4.title = "数码"
        let vc5  = BTTopTitlesViewController()
        vc5.title = "美物"
        let vc6  = BTTopTitlesViewController()
        vc6.title = "杂货"
        
        
        let vcArr = [vc1,vc2,vc3,vc4,vc5,vc6]
        
        for index in 0...5 {
            addChildViewController(vcArr[index])
        }
        
        setUpTitlesView()
        setUpContentView()

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func setUpNav(){
        
       self.title = "半塘"
       view.backgroundColor = UIColor.white
         navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "Feed_SearchBtn_18x18_"), style: .plain, target: self, action: #selector(test))
    }
    
    
    
    func setUpContentView(){
        
       automaticallyAdjustsScrollViewInsets = false
        
        let contentView = UIScrollView()
        contentView.frame = view.bounds
        contentView.delegate = self
   
        contentView.isPagingEnabled = true
        view.insertSubview(contentView, at: 0)
        
        contentView.contentSize = CGSize.init(width: CGFloat(childViewControllers.count)*contentView.width, height: 0)
        
        self.contentView = contentView
        
        scrollViewDidEndScrollingAnimation(contentView)
        
    }
    
    //滑动切换
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        scrollViewDidEndScrollingAnimation(scrollView)
        let index = Int(scrollView.contentOffset.x / scrollView.width)
        let button = titlesView!.subviews[index] as! UIButton
        
        for ff in (titlesView?.subviews)! {
            if ff.tag-10 == index {
                titleClick(button: (ff as? UIButton)!)
            }
        }
        
    }
    
    //titleClick(button: button)
    //添加控制器
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        let index = Int(scrollView.contentOffset.x / scrollView.width)
        let vc = childViewControllers[index]
        vc.view.x = scrollView.contentOffset.x
        vc.view.y = 0
        vc.view.height = scrollView.height
        scrollView.addSubview(vc.view)
    }
    
    
    
    func test(){
        print("点击搜索")
    }
    
    
    //顶部标签栏
    func setUpTitlesView(){
        
        let bgView = UIView()
        bgView.frame = CGRect.init(x: 0, y: titlesViewTop, width: screenWidth, height: titlesViewH)
        view.addSubview(bgView)
        
        let titlesView = UIView()
        titlesView.backgroundColor = UIColor.white
        titlesView.frame = CGRect.init(x: 0, y: 0, width: screenWidth-titlesViewH, height: titlesViewH)
        bgView.addSubview(titlesView)
        
        self.titlesView = titlesView
        
        //底部红色指示器
        let indicatorView = UIView()
        indicatorView.backgroundColor = YMGlobalRedColor()
        indicatorView.height = kIndicatorViewH
        indicatorView.y = kTitlesViewH-kIndicatorViewH
//        indicatorView.tag = -1
        self.indicatorView = indicatorView
        
        //右侧选择按钮
        let selectButton = UIButton()
        selectButton.isUserInteractionEnabled = true
        selectButton.backgroundColor = UIColor.white
        selectButton.frame = CGRect.init(x: screenWidth - kTitlesViewH, y: 0, width: kTitlesViewH, height: kTitlesViewH)
        selectButton.setImage(UIImage.init(named:"arrow_index_down_8x4_"), for: .normal)
        selectButton.addTarget(self, action: #selector(selectButtonClick), for: .touchUpInside)
        
       titlesView.addSubview(selectButton)
        
        //内部子标签
        let count = childViewControllers.count
        let width = titlesView.width/CGFloat(count)
        let height = titlesView.height
        
        for index in 0..<count {
            
            let button : UIButton = UIButton.init(type: .custom)
            button.height = height
            button.width = width
            button.x = CGFloat(index)*width
            button.tag = index + 10
            
            
            let vc = childViewControllers[index]
            button.titleLabel!.font = UIFont.systemFont(ofSize: 14)
            button.setTitle(vc.title, for: .normal)
            button.setTitleColor(UIColor.gray, for: .normal)
            button.setTitleColor(YMGlobalRedColor(), for: .disabled)
            button.addTarget(self, action: #selector(titleClick), for: .touchUpInside)
            
            titlesView.addSubview(button)
            
            //默认点击第一个
            if index == 0 {
                button.isEnabled = false;
                selectedButton = button
                //
                button.titleLabel?.sizeToFit()
                indicatorView.width = button.titleLabel!.width
                indicatorView.centerX = button.centerX
            }
   
        }
        
        titlesView.addSubview(indicatorView);
        
    }
    
    
    //更多选择
    func selectButtonClick(button:UIButton){
        UIView.animate(withDuration: kAnimationDuration) {
            
            button.imageView?.transform = button.imageView!.transform.rotated(by: CGFloat(M_PI))
        }
    }
    
    //标题选择
    func titleClick(button:UIButton){
        
        selectedButton!.isEnabled = true
        button.isEnabled = false
        selectedButton = button
        
        //指示器移动
        UIView.animate(withDuration: kAnimationDuration) { 
            self.indicatorView!.width = self.selectedButton!.titleLabel!.width
            self.indicatorView!.centerX = self.selectedButton!.centerX
            
            self.view.layoutIfNeeded()
        }
        
        var offset = contentView!.contentOffset
        offset.x = CGFloat(button.tag-10)*contentView!.width
        contentView!.setContentOffset(offset, animated: true)
 
    }
    
    
    
    
    


}
