//
//  DYNavigationController.swift
//  DouyuTV
//
//  Created by lovelydd on 16/1/14.
//  Copyright © 2016年 xiaomutou. All rights reserved.
//

import UIKit

class DYNavigationController: UINavigationController {

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.configUI()
        self.configPopGesture()
        
    }
    
    func configUI() {
        
        
        self.navigationBar.setBackgroundImage(UIImage.imageWithColor(RGB(254, 119, 0)), forBarMetrics: .Default)
        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
    }
    
    func configPopGesture() {
        //获取系统的target
        let target = self.interactivePopGestureRecognizer?.delegate
        
        let pan = UIPanGestureRecognizer(target: target, action: Selector("handleNavigationTransition:"))
        pan.delegate = self;
        self.view.addGestureRecognizer(pan)
        self.interactivePopGestureRecognizer?.enabled = false
    }
    
    override func pushViewController(viewController: UIViewController, animated: Bool) {
        
        if self.viewControllers.count > 0 {
            
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
}


extension DYNavigationController: UIGestureRecognizerDelegate {
    
    
    internal func gestureRecognizerShouldBegin(gestureRecognizer: UIGestureRecognizer) -> Bool {
        
        let translation : CGPoint = (gestureRecognizer as! UIPanGestureRecognizer).translationInView(self.view.superview)
        
        if (translation.x < 0) {
            
            return false;  //左滑不做处理
        }
        
        if (self.viewControllers.count <= 1) {
            
            return false;
        }
        return true
    }
}