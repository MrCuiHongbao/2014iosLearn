//
//  ViewController.swift
//  AdaptiveLayout
//
//  Created by zhangliang on 14-10-14.
//  Copyright (c) 2014年 com.yourcompany.orgnanization. All rights reserved.
//

import UIKit

import LocalAuthentication

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var authButton: UIButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
        authButton.frame = CGRect(x: 100, y:UIScreen.mainScreen().bounds.size.height / 2, width: 100, height: 30)
        authButton.setTitle("Authenticate", forState: UIControlState.Normal)
        authButton.addTarget(self, action: Selector("addPassAction:"), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(authButton)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

    }
    
    func addPassAction(sender:UIButton!){
        
        var laContext = LAContext()
        laContext.localizedFallbackTitle = "不使用指纹"
        var authError : NSError?
        var errorReason = "请用指纹验证"
        
        if laContext.canEvaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, error: &authError){
            laContext.evaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, localizedReason: errorReason, reply: {
                (success, error) in
                if success {
                    var alertVC:UIAlertController = UIAlertController(title:"结果展示", message: "成功", preferredStyle: UIAlertControllerStyle.Alert)
                    var alertActionSure: UIAlertAction = UIAlertAction(title: "确定", style: UIAlertActionStyle.Default, handler: {action in alertVC.dismissViewControllerAnimated(true, completion: nil)})
                    var alertActionCancel: UIAlertAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: {action in alertVC.dismissViewControllerAnimated(true, completion: nil)})
                    alertVC.addAction(alertActionSure)
                    alertVC.addAction(alertActionCancel)
                    self.presentViewController(alertVC, animated:true, completion: nil)
                }
                else{
                    
                    if error!.code == -2 {
                        var alertVC:UIAlertController = UIAlertController(title:"结果展示 " + "用户取消了指纹输入", message: "失败", preferredStyle: UIAlertControllerStyle.Alert)
                        var alertActionSure: UIAlertAction = UIAlertAction(title: "确定", style: UIAlertActionStyle.Default, handler: {action in alertVC.dismissViewControllerAnimated(true, completion: nil)})
                        var alertActionCancel: UIAlertAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: {action in alertVC.dismissViewControllerAnimated(true, completion: nil)})
                        alertVC.addAction(alertActionSure)
                        alertVC.addAction(alertActionCancel)
                        self.presentViewController(alertVC, animated:true, completion: nil)
                    }else if error!.code == -3 {
                        println(error!.userInfo![NSLocalizedDescriptionKey])
                        var alertVC:UIAlertController = UIAlertController(title:"结果展示" + error!.userInfo!.description , message: "失败", preferredStyle: UIAlertControllerStyle.Alert)
                        var alertActionSure: UIAlertAction = UIAlertAction(title: "确定", style: UIAlertActionStyle.Default, handler: {action in alertVC.dismissViewControllerAnimated(true, completion: nil)})
                        var alertActionCancel: UIAlertAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: {action in alertVC.dismissViewControllerAnimated(true, completion: nil)})
                        alertVC.addAction(alertActionSure)
                        alertVC.addAction(alertActionCancel)
                        self.presentViewController(alertVC, animated:true, completion: nil)
                    }
                }
            })
        }
        else{
            var alert = UIAlertView(title: "Can not do authenticatation", message: authError!.description, delegate: nil, cancelButtonTitle: "Cancel")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

