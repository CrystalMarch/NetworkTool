//
//  Network.swift
//  terncommerce
//
//  Created by 朱慧平 on 2018/1/16.
//  Copyright © 2018年 terncommerce. All rights reserved.
//

import Foundation
class NetworkTool: NSObject {
    var successCallBack:(([String:AnyObject])->(Void))?
    var failResponseStatusCodeCallBack:((Int)->(Void))?
    
    func request(requestUrl:String,method: String,param:[String:AnyObject]?) {
        let session: URLSession = URLSession.shared
        let url: NSURL = NSURL(string: requestUrl)!
        let request: NSMutableURLRequest = NSMutableURLRequest(url: url as URL)
        request.httpMethod = method
        
        // you can set http header field
        
//        request.setValue("", forHTTPHeaderField: "Authorization")
//        if UserDefaults.standard.object(forKey: token) != nil {
//            request.setValue(UserDefaults.standard.object(forKey: token) as! String, forHTTPHeaderField: "x-token")
//        }
        
        
        // you can change the Content-Type value  to you want
         request.setValue("application/x-www-form-urlencoded; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        let postBody = NSMutableData()
        var dicString = ""
        if (param != nil) {
            for indexString in param!.keys {
                if dicString.characters.count == 0{
                    dicString = "\(indexString)=\(param![indexString]!)"
                }else{
                    dicString.append("&\(indexString)=\(param![indexString]!)")
                }
            }
            postBody.append(dicString.data(using: String.Encoding.utf8)!)
            request.httpBody = postBody as Data
        }
        
        let dataTask: URLSessionDataTask = session.dataTask(with: request as URLRequest) { (data, response, error) in
            let httpResponse = response as! HTTPURLResponse
            let responseStatusCode = httpResponse.statusCode
            DispatchQueue.global().async {
                DispatchQueue.main.async {
                    if responseStatusCode != 200{
                        self.failResponseStatusCodeCallBack!(responseStatusCode)
                    }else{
                        var dict:NSDictionary? = nil
                        do {
                            dict  = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.init(rawValue: 0)) as? NSDictionary
                            self.successCallBack!(dict as! [String : AnyObject])
                        } catch {
                            
                        }
                    }
                }
            }
        }
        dataTask.resume()
    }
}


