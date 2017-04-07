//
//  bantangViewModel.swift
//  BangTang_Demo
//
//  Created by admin on 2017/4/7.
//  Copyright © 2017年 com.gz.bingoMobileSchools. All rights reserved.
//

import UIKit

class bantangViewModel: NSObject {
    
    
    func getDataList(compeleted:@escaping (_ result:NSArray) -> ()){
        
        httpTool.requestData(.get, urlString: "http://api.dantangapp.com/v1/channels/4/items?gender=1&generation=1&limit=20&offset=0", parameters: nil) { (responce) in
            
            guard let dict = responce as? [String : Any] else {return}
            
            guard let dict2 = dict["data"] as? [String:Any] else{return}
            
            let dataArr = dict2["items"] as! NSArray
            var model = [banTangModel]()
            //字典转模型
            for dict in dataArr {
                
                let homeItem = banTangModel(dict: dict as! [String: AnyObject])
                model.append(homeItem)
                
            }
            
            print("----------\(model)")
            
            compeleted(model as NSArray)
            
        }
        
    }
    
    

}
