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

    // ----------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //showWeather()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // ----------------------------------------------------------------
    
    @IBAction func getWeatherAction(sender: AnyObject) {
        self.getWeather { (description) -> Void in
            print("ここ来てないんじゃないの？ → 来てない")
            self.showAlert(message: description)
        }
    }
    
    // ----------------------------------------------------------------
    
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
                    print("success", response.result.value!)
                    self.showAlert(message: response.result.description) // アラートを表示
                }
                break
                
            case .failure(_):
                print("failure:", response.result.error!)
                break
            }
        }
    }
    
    
    
    func showAlert(message:String) {
        let alertController:UIAlertController = UIAlertController(title: "確認", message: message, preferredStyle: .alert)
        let okAction:UIAlertAction = UIAlertAction(title: "OK", style: .default) { (alert) -> Void in
            // OKを選択したときに実行される処理
        }
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
    }

}

