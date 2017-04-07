//
//  httpTool.swift
//  BangTang_Demo
//
//  Created by admin on 2017/4/7.
//  Copyright © 2017年 com.gz.bingoMobileSchools. All rights reserved.
//

import UIKit
import Alamofire


enum MethodType {
    case get
    case post
}

class httpTool {
    
    
    class func requestData(_ type : MethodType,urlString:String,parameters:[String:Any]? = nil,compeleted:@escaping(_ result:Any) ->()){
        
        let mothod = type == .get ? HTTPMethod.get : HTTPMethod.post
        
        Alamofire.request(urlString, method: mothod, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            
            guard let result = response.result.value else {
                print(response.result.error ?? -1)
                return
            }
            compeleted(result)
            
        }
    }
}
