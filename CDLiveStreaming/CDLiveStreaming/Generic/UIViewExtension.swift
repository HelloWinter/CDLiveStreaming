//
//  UIViewExtension.swift
//  CDLiveStreaming
//
//  Created by chengdong on 2020/4/19.
//  Copyright © 2020 chengdong. All rights reserved.
//

import UIKit


extension UIView{
    static func loadFromNib(_ nibname : String? = nil) -> Self {
        let loadName = nibname == nil ? "\(self)" : nibname!
        return Bundle.main.loadNibNamed(loadName, owner: nil, options: nil)?.first as! Self
    }
}
