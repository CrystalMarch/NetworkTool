# NetworkTool
Simple encapsulation of NSURLSession network requests using the swift language. ---（使用swift语言对NSURLSession网络请求进行的简单封装）

Example:

        let networkTool = NetworkTool()
        networkTool.request(requestUrl: "", method: "POST", param: ["username" : "" as AnyObject,"password":"" as AnyObject])
        networkTool.failResponseStatusCodeCallBack = { (result) -> Void in
            print(result)
        }
        networkTool.successCallBack = { (resultDic) -> Void in
            print(resultDic)
        }
        
 you can set the request header based on you actual needs.
        
        request.setValue("", forHTTPHeaderField: "Authorization")
        if UserDefaults.standard.object(forKey: token) != nil {
            request.setValue(UserDefaults.standard.object(forKey: token) as! String, forHTTPHeaderField: "x-token")
        }
         request.setValue("application/x-www-form-urlencoded; charset=UTF-8", forHTTPHeaderField: "Content-Type")
