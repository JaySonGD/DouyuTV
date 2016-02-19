//
//  UIBarButtonItem+Addition.swift
//  DouyuTV
//
//  Created by lovelydd on 16/1/21.
//  Copyright © 2016年 xiaomutou. All rights reserved.
//

import UIKit
import Foundation

extension UIBarButtonItem {
    
    typealias barButtonItemCallback = () -> Void
    
    
    private struct BarbuttonItemCallBackAssociateKeys {
        
        static var dd_barButtonItemCallBackKey = "dd_barButtonItemCallBackKey"
    }
    
    class SetupCallBack {
        
        var callBack: barButtonItemCallback?
        init(callback: (() -> Void)?) {
            self.callBack = callback
        }
    }
    
    class var callBack:barButtonItemCallback? {
        
        set {
            
        objc_setAssociatedObject(self, &BarbuttonItemCallBackAssociateKeys.dd_barButtonItemCallBackKey, SetupCallBack(callback: newValue),.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            
            if let cl = objc_getAssociatedObject(self, &BarbuttonItemCallBackAssociateKeys.dd_barButtonItemCallBackKey) as? SetupCallBack{

                return cl.callBack
            }
            return nil;
        }
    }
    
    
//    class func buttonItem(image: UIImage?, selectedImage: UIImage?, callback: barButtonItemCallback) -> UIBarButtonItem {
//        
//        let customView = UIButton(type: .Custom)
//        customView.setImage(image, forState: .Normal)
//        customView.setImage(selectedImage, forState: .Selected)
//        customView.sizeToFit()
//        customView.addTarget(self, action: "itemClick", forControlEvents: .TouchUpInside)
//        self.callBack = callBack
//        
//        return UIBarButtonItem(customView: customView)
//    }
    
    class func buttonItem(image:UIImage?, selectedImage:UIImage?, closure:barButtonItemCallback)
        ->UIBarButtonItem{
            let custonView = UIButton(type:.Custom)
            custonView.setImage((image),forState: .Normal);
            custonView.setImage((selectedImage), forState: .Selected)
            custonView.sizeToFit()
            custonView.addTarget(self, action: "itemClick", forControlEvents: .TouchUpInside)
            self.callBack = closure
            return UIBarButtonItem(customView: custonView)
    }
    
    
    class func itemClick() {
        self.callBack?()
    }
}
