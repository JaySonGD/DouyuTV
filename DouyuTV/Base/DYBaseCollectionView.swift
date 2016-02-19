//
//  DYBaseCollectionView.swift
//  DouyuTV
//
//  Created by lovelydd on 16/1/14.
//  Copyright © 2016年 xiaomutou. All rights reserved.
//

import UIKit

class DYBaseCollectionView: UICollectionView {


    override func awakeFromNib() {
        
        super.awakeFromNib()
        self.defaultConfig()
    }
    
    func defaultConfig() {
        
        self.pagingEnabled = true
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
        self.bounces = true
    }
    

}
