//
//  DVTabbarController.swift
//  DouyuTV
//
//  Created by lovelydd on 16/1/14.
//  Copyright © 2016年 xiaomutou. All rights reserved.
//

import UIKit

class DVTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.defaultConfig()
        self.setUpViewControllers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
