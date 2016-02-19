//
//  DYBaseViewController.swift
//  DouyuTV
//
//  Created by lovelydd on 16/1/14.
//  Copyright © 2016年 xiaomutou. All rights reserved.
//

import UIKit

class DYBaseViewController: UIViewController {

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        
        self.navigationItem.titleView  = UIImageView(image: UIImage(named: "logo"))
    }
    
    
    
    
}
