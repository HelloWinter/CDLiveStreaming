//
//  ThirdLoginView.swift
//  CDLiveStreaming
//
//  Created by chengdong on 2020/4/18.
//  Copyright © 2020 chengdong. All rights reserved.
//

import UIKit

enum ThirdLoginType : Int{
    case WeChat = 1001,QQ = 1002,Sina = 1003
}

class ThirdLoginView: UIView {

    var loginClosure : ((_ type : ThirdLoginType)->Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("init(frame")
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        backgroundColor = UIColor.clear
    }
    
    @IBAction func loginClick(_ sender: UIButton) {
        if let loginClosure = loginClosure {
            loginClosure(ThirdLoginType.init(rawValue: sender.tag) ?? ThirdLoginType.WeChat)
        }
    }
    

}
