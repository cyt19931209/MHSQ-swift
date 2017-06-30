//
//  LoginViewController.swift
//  卖货神器
//
//  Created by CYT on 2017/5/2.
//  Copyright © 2017年 CYT. All rights reserved.
//

import UIKit

import MBProgressHUD


class LoginViewController: UIViewController {

    var number:NSInteger = 60;

    var phoneTextField:UITextField?;
    
    var passwordTextField:UITextField?;

    var codeButton:UIButton?;

    var selectImageV:UIImageView?;

    var XHImageV:UIImageView?;

    var cycyleTimer : Timer?;

    
    override func viewDidLoad() {
        super.viewDidLoad()

        //背景图片

        let bgImageV = UIImageView(frame : self.view.bounds);
        
        bgImageV.image = UIImage(named:"logobg");
        
        self.view.addSubview(bgImageV);
        
        //账号密码
        
        let midView = UIView(frame:CGRect(x:30, y:kScreenHeight/2 - 70,width:kScreenWidth - 75, height:140));
        
        self.view.addSubview(midView);
        
        //闲货提示框
        XHImageV = UIImageView(frame:CGRect(x:94, y:kScreenHeight/2 - 65 - 28 + 43,width:240, height:37));
        
        XHImageV!.image = UIImage(named:"tipsbg");

        self.view.addSubview(XHImageV!);
        
        let XHImageV1 = UIImageView(frame:CGRect(x:2, y:2,width:24, height:24));
        
        XHImageV1.image = UIImage(named:"tipslogo");
        
        XHImageV!.addSubview(XHImageV1);


        let XHLabel = UILabel(frame:CGRect(x:36, y:8,width:196, height:12))
        
        XHLabel.text = "使用闲货帐号可以直接登陆哦";
        
        XHLabel.font = UIFont.systemFont(ofSize: 14);
        
        XHLabel.textColor = UIColor.init(colorLiteralRed: 102/255.0, green: 102/255.0, blue: 102/255.0, alpha: 1);
        
        XHImageV?.addSubview(XHLabel);
        
        
        let lineView = UIView(frame: CGRect(x:0, y:48,width:midView.bounds.size.width, height:42));
        
        lineView.backgroundColor = UIColor.clear;
        
        lineView.layer.cornerRadius = 4;
        
        lineView.layer.masksToBounds = true;
        
        lineView.layer.borderWidth = 1;
        
        lineView.layer.borderColor = UIColor.colorWithHexString(hex:"d9d9d9").cgColor;
        
        midView.addSubview(lineView);

        
        let lineView1 = UIView(frame: CGRect(x:0, y:98,width:midView.bounds.size.width, height:42));
        
        lineView1.backgroundColor = UIColor.clear;
        
        lineView1.layer.cornerRadius = 4;
        
        lineView1.layer.masksToBounds = true;
        
        lineView1.layer.masksToBounds = accessibilityPerformEscape();
        
        lineView1.layer.borderWidth = 1;
        
        lineView1.layer.borderColor = UIColor.colorWithHexString(hex:"d9d9d9").cgColor;
        
        midView.addSubview(lineView1);
        
        //主账号和子账号选择按钮
        
        let mainButton:UIButton = UIButton(type:.custom);
        
        mainButton.frame = CGRect(x:0,y: 0, width:midView.width/2,height: 30);

        mainButton.setTitle("主账号", for:.normal);
        
        mainButton.setTitleColor(UIColor.colorWithHexString(hex:"666666"), for: .normal);
        
        mainButton.titleLabel?.font = UIFont.systemFont(ofSize: 16);
        
        mainButton.tag = 101;
        
        mainButton.isSelected = true;

        mainButton.addTarget(self, action:#selector(AccountChooseButtonAction(bt:)), for: .touchUpInside)
        
        midView.addSubview(mainButton);

        selectImageV = UIImageView.init(frame: CGRect(x:(midView.width/2 - 12)/2,y: 25, width:12,height: 6));
        
        selectImageV!.image = UIImage.init(named: "三角标@2x");
        
        mainButton.addSubview(selectImageV!);
        
        let sonButton:UIButton = UIButton(type:.custom);
        
        sonButton.frame = CGRect(x:midView.width/2,y: 0, width:midView.width/2,height: 30);
        
        sonButton.setTitle("子账号", for:.normal);

        sonButton.setTitleColor(UIColor.colorWithHexString(hex:"666666"), for: .normal);
        
        sonButton.titleLabel?.font = UIFont.systemFont(ofSize: 16);
        sonButton.tag = 102;
        sonButton.addTarget(self, action:#selector(AccountChooseButtonAction(bt:)), for: .touchUpInside)
        midView.addSubview(sonButton);
        
        //手机号和密码

        let phoneImageV = UIImageView.init(frame: CGRect(x:10,y: 58, width:22,height: 22));
        
        phoneImageV.image = UIImage.init(named: "账号");
        
        midView.addSubview(phoneImageV);

        phoneTextField = UITextField.init(frame: CGRect(x:phoneImageV.right+10,y: 60, width:200,height: 22));
        

        phoneTextField!.textColor = UIColor.colorWithHexString(hex: "666666");
        
        phoneTextField!.tag = 110;
        
        phoneTextField!.font = UIFont.systemFont(ofSize: 15);
        
        phoneTextField!.keyboardType = UIKeyboardType.emailAddress;
        
        //创建属性字典
        var attributes:[String:AnyObject] = NSMutableDictionary() as! [String:AnyObject]
        attributes[NSFontAttributeName] = UIFont.boldSystemFont(ofSize: 15);
        
        //创建带属性的字符串
        let string:NSAttributedString = NSAttributedString.init(string: "请输入手机号或者邮箱", attributes: attributes)
        //设置placeholder的属性
        
        phoneTextField!.attributedPlaceholder = string

        midView .addSubview(phoneTextField!);

        
        let showButton = UIButton(type:.custom);
        
        showButton.frame = CGRect(x:midView.width - 38,y: 57, width:24,height: 24);
        
        showButton.setImage(UIImage.init(named: "tips"), for: .normal);
        
        showButton.addTarget(self, action:#selector(showButtonAction), for: .touchUpInside)
        
        midView.addSubview(showButton);
        
        let passwordImageV = UIImageView.init(frame: CGRect(x:10,y: 110, width:22,height: 22))
        passwordImageV.image = UIImage.init(named: "密码");
        
        passwordImageV.tag = 121;
        
        midView.addSubview(passwordImageV);
        
        passwordTextField = UITextField.init(frame: CGRect(x:passwordImageV.right+10,y: 112, width:150,height: 22))
        
        passwordTextField!.textColor = UIColor.colorWithHexString(hex: "666666");
        passwordTextField!.tag = 111;
        passwordTextField!.isSecureTextEntry = true;
        passwordTextField!.font = UIFont.systemFont(ofSize: 15);
        passwordTextField!.placeholder = "请输入密码";
        //创建带属性的字符串
        let string1:NSAttributedString = NSAttributedString.init(string: "请输入密码", attributes: attributes)
        //设置placeholder的属性
        
        passwordTextField!.attributedPlaceholder = string1

        midView.addSubview(passwordTextField!);
        
        //验证码按钮

        codeButton = UIButton(type:.custom);
        
        codeButton!.frame = CGRect(x:midView.width-78,y: midView.height-30, width:68,height: 24);
        codeButton!.layer.cornerRadius = 4;
        codeButton!.layer.masksToBounds = true;
        codeButton!.layer.borderWidth = 1;
        codeButton!.tag = 120;
        
        codeButton!.isHidden = true;

        codeButton!.layer.borderColor = UIColor.colorWithHexString(hex:"949dff").cgColor;
        
        codeButton!.setTitle("获取验证码", for: .normal);
        
        codeButton!.setTitleColor(UIColor.colorWithHexString(hex: "949dff"), for:.normal);
        
        codeButton!.titleLabel!.font = UIFont.systemFont(ofSize: 12);
        
        codeButton!.addTarget(self, action:#selector(codeButtonAction(bt:)), for: .touchUpInside)

        midView.addSubview(codeButton!);
        
        //登录按钮
        
        let loginButton = UIButton(type:.custom);
        
        loginButton.frame = CGRect(x:30,y: midView.bottom+20, width:kScreenWidth - 75,height: 44);
        
        loginButton.setBackgroundImage(UIImage.init(named: "loginbtn0@2x"), for: .normal);

        loginButton.setBackgroundImage(UIImage.init(named: "LOGINBTN@2x"), for: .highlighted);

        loginButton.setTitle("登录", for: .normal);

        loginButton.setTitleColor(UIColor.colorWithHexString(hex: "949dff"), for: .normal);
        
        
        loginButton.titleLabel!.font = UIFont.systemFont(ofSize: 21);
        loginButton.layer.cornerRadius = 5;
        loginButton.layer.masksToBounds = true;
        
        loginButton.addTarget(self, action:#selector(loginButtonAction), for: .touchUpInside)
        self.view.addSubview(loginButton);
        
        //注册按钮
        let registButton = UIButton(type:.custom);
        
        registButton.frame = CGRect(x:kScreenWidth - 45 - 54,y: loginButton.bottom+13, width:54,height: 19);
        
        registButton.setTitle("免费注册", for: .normal);
        
        registButton.setTitleColor(UIColor.colorWithHexString(hex: "949dff"), for: .normal);
        
        registButton.titleLabel!.font = UIFont.systemFont(ofSize: 13);
        
        registButton.addTarget(self, action:#selector(registButtonAction), for: .touchUpInside)

        self.view.addSubview(registButton);

        //忘记密码
        
        let passwordButton = UIButton(type:.custom);
        
        passwordButton.frame = CGRect(x:20,y: loginButton.bottom+15, width:80,height: 15);

        passwordButton.setTitle("忘记密码?", for: .normal);
        
        passwordButton.setTitleColor(UIColor.colorWithHexString(hex: "666666"), for: .normal);

        passwordButton.titleLabel!.font = UIFont.systemFont(ofSize: 13);

        passwordButton.addTarget(self, action:#selector(passwordButtonAction), for: .touchUpInside)

        self.view.addSubview(passwordButton);
        
        //免密登录
        
        let avoidCloseButton = UIButton(type:.custom);

        avoidCloseButton.tag = 200;
        
        avoidCloseButton.frame = CGRect(x:kScreenWidth/2 - 40,y: loginButton.bottom+15, width:80,height: 15);
        
        avoidCloseButton.setTitle("免密登录", for: .normal);

        avoidCloseButton.setTitle("密码登录", for: .selected);

        avoidCloseButton.setTitleColor(UIColor.colorWithHexString(hex: "949dff"), for: .normal);

        avoidCloseButton.titleLabel!.font = UIFont.systemFont(ofSize: 14);

        avoidCloseButton.addTarget(self, action:#selector(avoidCloseButtonAction(bt:)), for: .touchUpInside)
        
        self.view.addSubview(avoidCloseButton);

        
        let singleRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(singleAction));
        
            //点击的次数
        singleRecognizer.numberOfTapsRequired = 1;
        
        singleRecognizer.cancelsTouchesInView = false;
            //给self.view添加一个手势监测；
        self.view.addGestureRecognizer(singleRecognizer);
        
        
    
    }
    //主账号和子账号选择

    func AccountChooseButtonAction(bt:UIButton){
        
        if bt.isSelected == false {
            
            if bt.tag == 101 {

                let sonButton :(UIButton) = self.view.viewWithTag(102) as! UIButton;
                
                sonButton.isSelected = false;

                bt.isSelected = true;

                phoneTextField!.text = "";
                
                passwordTextField!.text = "";

                bt.addSubview(selectImageV!);

            }else if bt.tag == 102 {
            
                let mainButton :(UIButton) = self.view.viewWithTag(101) as! UIButton;
                
                mainButton.isSelected = false;
                
                bt.isSelected = true;
                
                phoneTextField!.text = "";
                
                passwordTextField!.text = "";
                
                bt.addSubview(selectImageV!);
                
            }
            
            
        }
        
        
    }

    //显示闲货视图
    func showButtonAction(){
        
        XHImageV!.isHidden = false;

    }
    //点击消失
    func singleAction(){
        
        
        XHImageV!.isHidden = true;
        
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
        
        params["code_type"] = "3";
        
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
    //登录
    func loginButtonAction(){
        
        
        var params = [String:String]()
        

        let hud = MBProgressHUD.showAdded(to: self.view, animated: true);

        hud.mode = MBProgressHUDMode.text;
        
        if phoneTextField!.text == "" {
            
            hud.label.text = "账号不能为空";
            
            hud.hide(animated: true, afterDelay: 2);
            
            return
        }
        
        let button = self.view.viewWithTag(200) as! UIButton;

        var url = "";
        
        if !button.isSelected {
            
            if passwordTextField!.text == "" {
                
                hud.label.text = "密码不能为空";
                
                hud.hide(animated: true, afterDelay: 2);
                
                return
                
            }
            
            url = master_loginhtmlA_API;
            
            params["password"] = passwordTextField!.text;

            
        }else{
            
            if passwordTextField!.text == "" {
                
                hud.label.text = "验证码不能为空";
                
                hud.hide(animated: true, afterDelay: 2);
                
                return
            }
        
            url = child_loginhtml_API;
            
            params["code"] = passwordTextField!.text;


        }
        
        hud.hide(animated: false);

        params["mobile"] = phoneTextField!.text;
        

        DataManagement.shareInstance.POST_Request(url:url , parameters: params as [String : AnyObject]) { (result, isSuccess) in
            
            print(result.dictionary!);
            
            // 请求成功
            if isSuccess {

                let defaults = UserDefaults.standard;
                
                defaults.set(result["id"].string, forKey: "uid");
                
                defaults.synchronize();
                
            }
            
        }
        
    }
    
    //注册
    func registButtonAction(){
        
        let registVC = RegistViewController();
        
        self.present(registVC, animated: true, completion: nil);

        
    }
    
    //忘记密码
    
    func passwordButtonAction(){
        
        let passwordRecoveryVC = PasswordRecoveryViewController();
        
        self.present(passwordRecoveryVC, animated: true, completion: nil);
        
    }
    
    //免密登录
    
    func avoidCloseButtonAction(bt:UIButton){
        
        bt.isSelected = !bt.isSelected;
        
        var attributes:[String:AnyObject] = NSMutableDictionary() as! [String:AnyObject]
        attributes[NSFontAttributeName] = UIFont.boldSystemFont(ofSize: 15);
        
        
        if (bt.isSelected) {
            
            let imageV:UIImageView = self.view.viewWithTag(121) as! UIImageView;
            
            imageV.image = UIImage.init(named: "验证码");
            
            let button:UIButton = self.view.viewWithTag(120) as! UIButton;
            
            button.isHidden = false;
            
            //创建带属性的字符串
            let string:NSAttributedString = NSAttributedString.init(string: "请输入验证码", attributes: attributes);
            
            passwordTextField!.width = 100;

            passwordTextField!.attributedPlaceholder = string
            
        }else{
            
            let imageV:UIImageView = self.view.viewWithTag(121) as! UIImageView;
            
            imageV.image = UIImage.init(named: "密码");
            
            let button:UIButton = self.view.viewWithTag(120) as! UIButton;
            
            button.isHidden = true;
        
            passwordTextField!.width = 150;
            
            //创建带属性的字符串
            let string:NSAttributedString = NSAttributedString.init(string: "请输入密码", attributes: attributes);
            
            passwordTextField!.attributedPlaceholder = string;
            
        }
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
