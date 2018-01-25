//
//  ViewController.swift
//  NetworkTool
//
//  Created by 朱慧平 on 2018/1/25.
//  Copyright © 2018年 NetworkTool. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let networkTool = NetworkTool()
        networkTool.request(requestUrl: "", method: "POST", param: ["username" : "" as AnyObject,"password":"" as AnyObject])
        networkTool.failResponseStatusCodeCallBack = { (result) -> Void in
            print(result)
        }
        networkTool.successCallBack = { (resultDic) -> Void in
            print(resultDic)
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

