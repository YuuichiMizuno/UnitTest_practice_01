//
//  ViewController.swift
//  UnitTest_practice_01
//
//  Created by yuichi.watanabe on 2016/12/06.
//  Copyright © 2016年 yuuichi.watanabe. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        showWeather()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showWeather() {
        self.getWeather{(description) -> Void in
            print(description)
        }
    }
    
    
    // http://jsonplaceholder.typicode.com/
    // ATS 回避のため 9.3
    
    func getWeather(closure:(String) -> Void) {

        Alamofire.request("http://jsonplaceholder.typicode.com/todos").responseJSON { (response:DataResponse<Any>) -> Void in
            
            switch(response.result) {
            case .success(_):
                if response.result.value != nil{
                    print(response.result.value!)

                    
                    //self.showAlert(response.result.description) // アラートを表示
                }
                break
                
            case .failure(_):
                print(response.result.error!)
                break
            }
            
        }
        
    
        
        
    }

}

