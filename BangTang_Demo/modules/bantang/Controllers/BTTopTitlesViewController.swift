//
//  BTTopTitlesViewController.swift
//  BangTang_Demo
//
//  Created by admin on 2017/4/7.
//  Copyright © 2017年 com.gz.bingoMobileSchools. All rights reserved.
//

import UIKit

class BTTopTitlesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    var tableview = UITableView()
    var  arrdata : NSMutableArray = []
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
     

        setUpUI()
        
        
        var viewModel = bantangViewModel()
    
        viewModel.getDataList { (dataArr) in
            
            self.arrdata = dataArr.mutableCopy() as! NSMutableArray
            self.tableview.reloadData()
        }
        
        
        
        }
        
        // Do any additional setup after loading the view.
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func setUpUI(){
        
        self.tableview = UITableView.init(frame: self.view.frame, style: .plain)
        self.tableview.contentInset = UIEdgeInsetsMake(kTitlesViewY + kTitlesViewH, 0, (tabBarController?.tabBar.height)!, 0)
        self.tableview.register(TopTitlesCell.self, forCellReuseIdentifier: "testCell")
        self.tableview.delegate = self
        self.tableview.dataSource = self
        
        self.view.addSubview(self.tableview)
        
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
      
//        var  cell:TopTitlesCell = TopTitlesCell.init(style: .subtitle, reuseIdentifier: "testCell")
        
         var  cell:TopTitlesCell = tableView.dequeueReusableCell(withIdentifier: "testCell", for: indexPath) as! TopTitlesCell
        
       
        cell.dataModel = self.arrdata[indexPath.row] as! banTangModel
        
        return cell
        
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 160
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.arrdata.count
        
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
