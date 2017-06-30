//
//  RegistViewController.swift
//  卖货神器
//
//  Created by CYT on 2017/5/4.
//  Copyright © 2017年 CYT. All rights reserved.
//

import UIKit

import MBProgressHUD


class RegistViewController: UIViewController {

    var number:NSInteger = 60;
    
    var phoneTextField:UITextField?;
    
    var passwordTextField:UITextField?;
    
    var codeTextField:UITextField?;

    var nameTextField:UITextField?;
    
    var codeButton:UIButton?;
    
    var cycyleTimer : Timer?;

    
    override func viewDidLoad() {
        super.viewDidLoad()

        //背景图片
        
        let bgImageV = UIImageView(frame : self.view.bounds);
        
        bgImageV.image = UIImage(named:"logobg");
        
        self.view.addSubview(bgImageV);

        //账号密码
        
        let midView = UIView(frame:CGRect(x:30, y:kScreenHeight/2 - 108,width:kScreenWidth - 60, height:216));
        
        self.view.addSubview(midView);
        
        
        //中间线
        
        let lineView = UIView(frame: CGRect(x:0, y:8,width:midView.bounds.size.width, height:44));
        
        lineView.backgroundColor = UIColor.clear;
        
        lineView.layer.cornerRadius = 4;
        
        lineView.layer.masksToBounds = true;
        
        lineView.layer.borderWidth = 1;
        
        lineView.layer.borderColor = UIColor.colorWithHexString(hex:"d9d9d9").cgColor;
        
        midView.addSubview(lineView);
        
        
        let lineView1 = UIView(frame: CGRect(x:0, y:lineView.bottom+10,width:midView.bounds.size.width, height:44));
        
        lineView1.backgroundColor = UIColor.clear;
        
        lineView1.layer.cornerRadius = 4;
        
        lineView1.layer.masksToBounds = true;
        
        lineView1.layer.masksToBounds = accessibilityPerformEscape();
        
        lineView1.layer.borderWidth = 1;
        
        lineView1.layer.borderColor = UIColor.colorWithHexString(hex:"d9d9d9").cgColor;
        
        midView.addSubview(lineView1);

        let lineView2 = UIView(frame: CGRect(x:0, y:lineView1.bottom+10,width:midView.bounds.size.width, height:44));
        
        lineView2.backgroundColor = UIColor.clear;
        
        lineView2.layer.cornerRadius = 4;
        
        lineView2.layer.masksToBounds = true;
        
        lineView2.layer.masksToBounds = accessibilityPerformEscape();
        
        lineView2.layer.borderWidth = 1;
        
        lineView2.layer.borderColor = UIColor.colorWithHexString(hex:"d9d9d9").cgColor;
        
        midView.addSubview(lineView2);
        
        let lineView3 = UIView(frame: CGRect(x:0, y:lineView2.bottom+10,width:midView.bounds.size.width, height:44));
        
        lineView3.backgroundColor = UIColor.clear;
        
        lineView3.layer.cornerRadius = 4;
        
        lineView3.layer.masksToBounds = true;
        
        lineView3.layer.masksToBounds = accessibilityPerformEscape();
        
        lineView3.layer.borderWidth = 1;
        
        lineView3.layer.borderColor = UIColor.colorWithHexString(hex:"d9d9d9").cgColor;
        
        midView.addSubview(lineView3);
        
        
        //手机号和密码 店名 短信验证码
        
        //店名

        let nameLabel = UILabel.init(frame: CGRect(x:10,y: 20, width:40,height: 20));

        nameLabel.text = "店名:";
        
        nameLabel.textColor = UIColor.colorWithHexString(hex: "666666");
        
        nameLabel.font = UIFont.systemFont(ofSize: 15);
        
        midView.addSubview(nameLabel);
        
        nameTextField = UITextField.init(frame: CGRect(x:nameLabel.right+10,y: nameLabel.top, width:200,height: 20));
        
        nameTextField!.textColor = UIColor.colorWithHexString(hex: "666666");
        
        nameTextField!.tag = 110;
        
        nameTextField!.font = UIFont.systemFont(ofSize: 15);
        
        nameTextField!.keyboardType = UIKeyboardType.emailAddress;

        nameTextField!.placeholder = "请输入店名";

        midView.addSubview(nameTextField!);
        
        //账号
        
        let phoneLabel = UILabel.init(frame: CGRect(x:10,y: nameLabel.top+54, width:40,height: 20));
        
        phoneLabel.text = "账号:";
        
        phoneLabel.textColor = UIColor.colorWithHexString(hex: "666666");
        
        phoneLabel.font = UIFont.systemFont(ofSize: 15);
        
        midView.addSubview(phoneLabel);
        
        phoneTextField = UITextField.init(frame: CGRect(x:phoneLabel.right+10,y: phoneLabel.top, width:200,height: 20));
        
        phoneTextField!.textColor = UIColor.colorWithHexString(hex: "666666");
        
        phoneTextField!.tag = 111;
        
        phoneTextField!.font = UIFont.systemFont(ofSize: 15);
        
        phoneTextField!.keyboardType = UIKeyboardType.emailAddress;
        
        phoneTextField!.placeholder = "请输入手机号或者邮箱";
        
        midView.addSubview(phoneTextField!);

        //密码
        let passwordLabel = UILabel.init(frame: CGRect(x:10,y: phoneLabel.top+54, width:40,height: 20));
        
        passwordLabel.text = "密码:";
        
        passwordLabel.textColor = UIColor.colorWithHexString(hex: "666666");
        
        passwordLabel.font = UIFont.systemFont(ofSize: 15);
        
        midView.addSubview(passwordLabel);
        
        passwordTextField = UITextField.init(frame: CGRect(x:passwordLabel.right+10,y: passwordLabel.top, width:200,height: 20));
        
        passwordTextField!.textColor = UIColor.colorWithHexString(hex: "666666");
        
        passwordTextField!.tag = 112;
        
        passwordTextField!.font = UIFont.systemFont(ofSize: 15);
        
        passwordTextField!.keyboardType = UIKeyboardType.emailAddress;
        
        passwordTextField!.placeholder = "请输入密码";
        
        midView.addSubview(passwordTextField!);
        
        //验证码
        let codeLabel = UILabel.init(frame: CGRect(x:10,y: passwordLabel.top+54, width:55,height: 20));
        
        codeLabel.text = "验证码:";
        
        codeLabel.textColor = UIColor.colorWithHexString(hex: "666666");
        
        codeLabel.font = UIFont.systemFont(ofSize: 15);
        
        midView.addSubview(codeLabel);
        
        codeTextField = UITextField.init(frame: CGRect(x:codeLabel.right,y: codeLabel.top, width:100,height: 20));
        
        codeTextField!.textColor = UIColor.colorWithHexString(hex: "666666");
        
        codeTextField!.tag = 113;
        
        codeTextField!.font = UIFont.systemFont(ofSize: 15);
        
        codeTextField!.keyboardType = UIKeyboardType.emailAddress;
        
        codeTextField!.placeholder = "请输入验证码";
        
        midView.addSubview(codeTextField!);

        
        //验证码按钮
        
        codeButton = UIButton(type:.custom);
        
        codeButton!.frame = CGRect(x:midView.width-78,y: codeLabel.top, width:68,height: 24);
        codeButton!.layer.cornerRadius = 4;
        codeButton!.layer.masksToBounds = true;
        codeButton!.layer.borderWidth = 1;
        codeButton!.tag = 120;
        
        codeButton!.layer.borderColor = UIColor.colorWithHexString(hex:"949dff").cgColor;
        
        codeButton!.setTitle("获取验证码", for: .normal);
        
        codeButton!.setTitleColor(UIColor.colorWithHexString(hex: "949dff"), for:.normal);
        
        codeButton!.titleLabel!.font = UIFont.systemFont(ofSize: 12);
        
        codeButton!.addTarget(self, action:#selector(codeButtonAction(bt:)), for: .touchUpInside)
        
        midView.addSubview(codeButton!);
        
        //注册按钮
        
        let registButton = UIButton(type:.custom);
        
        registButton.frame = CGRect(x:30,y: midView.bottom+20, width:kScreenWidth - 60,height: 44);
        
        registButton.setBackgroundImage(UIImage.init(named: "loginbtn0@2x"), for: .normal);
        
        registButton.setBackgroundImage(UIImage.init(named: "LOGINBTN@2x"), for: .highlighted);
        
        registButton.setTitle("注册", for: .normal);
        
        registButton.setTitleColor(UIColor.colorWithHexString(hex: "949dff"), for: .normal);
        
        
        registButton.titleLabel!.font = UIFont.systemFont(ofSize: 21);
        registButton.layer.cornerRadius = 5;
        registButton.layer.masksToBounds = true;
        
        registButton.addTarget(self, action:#selector(registButtonAction), for: .touchUpInside)
        self.view.addSubview(registButton);
        
        //登录按钮
        let loginButton = UIButton(type:.custom);
        
        loginButton.frame = CGRect(x:kScreenWidth/2-100,y: registButton.bottom+20, width:200,height: 15);
        
        loginButton.setTitle("已有奢易购账号？去登录", for: .normal);
        
        loginButton.setTitleColor(UIColor.colorWithHexString(hex: "949dff"), for: .normal);
        
        loginButton.titleLabel!.font = UIFont.systemFont(ofSize: 13);
        
        loginButton.addTarget(self, action:#selector(loginButtonAction), for: .touchUpInside)
        
        self.view.addSubview(loginButton);
        
        
    }
    
    //注册
    func registButtonAction(){
        
        var params = [String:String]()
        
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true);
        
        hud.mode = MBProgressHUDMode.text;
        
        if nameTextField!.text == "" {
            
            hud.label.text = "店名不能为空";
            
            hud.hide(animated: true, afterDelay: 2);
            
            return
        }

        
        if phoneTextField!.text == "" {
            
            hud.label.text = "账号不能为空";
            
            hud.hide(animated: true, afterDelay: 2);
            
            return
        }
        
        if passwordTextField!.text == "" {
            
            hud.label.text = "密码不能为空";
            
            hud.hide(animated: true, afterDelay: 2);
            
            return
        }

        
        if codeTextField!.text == "" {
            
            hud.label.text = "验证码不能为空";
            
            hud.hide(animated: true, afterDelay: 2);
            
            return
        }

        

        hud.hide(animated: false);
        
        params["mobile"] = phoneTextField!.text;
        
        params["shop_name"] = nameTextField!.text;

        params["code"] = codeTextField!.text;

        params["password"] = passwordTextField!.text;
        
        
        DataManagement.shareInstance.POST_Request(url:registerhtml_API , parameters: params as [String : AnyObject]) { (result, isSuccess) in
            
            print(result.dictionary!);
            
            // 请求成功
            if isSuccess {
                
                let defaults = UserDefaults.standard;
                
                defaults.set(result["id"].string, forKey: "uid");
                
                defaults.synchronize();
                
            }
        }
        
    }


    
    //登录
    func loginButtonAction(){
        
        self.dismiss(animated: true, completion: nil);

    }
    
    
    //获取验证码
    
    func codeButtonAction(bt:UIButton){
        
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true);
        
        hud.mode = MBProgressHUDMode.text;
        
        if phoneTextField!.text == "" {
            
            hud.label.text = "账号不能为空";
            
            hud.hide(animated: true, afterDelay: 2);
            
            return
            
        }
        
        hud.hide(animated: false);
        
        var params = [String:String]()
        
        params["mobile"] = phoneTextField!.text;
        
        params["code_type"] = "2";
        
        DataManagement.shareInstance.POST_Request(url:send_codehtml_API , parameters: params as [String : AnyObject]) { (result, isSuccess) in
            
            print(result);
            
            // 请求成功
            if isSuccess {
                
                self.codeButton!.isUserInteractionEnabled = false;
                
                self.codeButton!.setTitleColor(UIColor.colorWithHexString(hex: "b3b3b3"), for:.normal);
                
                self.cycyleTimer = Timer(timeInterval: 1, target: self, selector: #selector(self.timeAction), userInfo: nil, repeats: true)
                
                RunLoop.main.add(self.cycyleTimer!, forMode:RunLoopMode.commonModes)
                
            }
            
        }
        
    }
    
    //定时器
    func timeAction(){
        
        if number == 0 {
            
            codeButton!.isUserInteractionEnabled = true;
            
            // 从运行循环中移除
            cycyleTimer?.invalidate()
            cycyleTimer = nil
            number = 60;
            
            codeButton!.setTitle("获取验证码", for: .normal);
            
            codeButton!.setTitleColor(UIColor.colorWithHexString(hex: "949dff"), for:.normal);
            
            
            
        }else {
            
            number -= 1;
            
            codeButton!.setTitle(String(number)+"秒", for: .normal);
            
        }
        
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  

}
