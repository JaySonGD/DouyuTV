//
//  DYRecommendCell.swift
//  DouyuTV
//
//  Created by lovelydd on 16/1/19.
//  Copyright © 2016年 xiaomutou. All rights reserved.
//

import UIKit

public class DYRecommendCell: UICollectionViewCell {

    static let recommendCellIdentifier = "recommendCellIdentifier"
    
    @IBOutlet weak var roomImageView: UIImageView!
    @IBOutlet weak var nickName: UILabel!
    @IBOutlet weak var roomName: UILabel!
    
    @IBOutlet weak var vistorCount: UILabel!

    var cellViewModel:RecommendDataCellModel = RecommendDataCellModel(){
        
        didSet {
            
            self.roomImageView.setImageWithURL(cellViewModel.roomImageUrl)
            self.nickName.text = cellViewModel.nickName
            self.roomName.text = cellViewModel.roomName
            self.vistorCount.text = cellViewModel.vistorCount
        }
    }
}
