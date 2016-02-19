//
//  UIViewController+Addition.swift
//  DouyuTV
//
//  Created by lovelydd on 16/1/22.
//  Copyright © 2016年 xiaomutou. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    
    func setupRecommendViewControllerStyle() {
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.buttonItem(
            UIImage(named: "Image_scan"),
            selectedImage: UIImage(named: "Image_scan_click"),
            closure: { (_) -> Void in

        })
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.buttonItem(UIImage(named: "btn_search"), selectedImage: UIImage(named: "btn_search_clicked"), closure: { () -> Void in
        })

    }
}
