//
//  DYRecommendCollectionView.swift
//  DouyuTV
//
//  Created by lovelydd on 16/1/19.
//  Copyright © 2016年 xiaomutou. All rights reserved.
//

import UIKit

@objc protocol DYRecommendCollectionViewDelegate: NSObjectProtocol {
    
    optional func circleView(circleView : DDCircleView, selectedAtIndex: Int)
}

public class DYRecommendCollectionResusableView : UICollectionReusableView {
    
    static let reusableViewID = "DYRecommendCollectionResusableViewID"
    
    @IBOutlet weak var title: UILabel!
}

struct RecommendUILayoutConfig {
    
    static var DYRecommendItemSize = CGSizeMake((DYUIUtils.ScreenWidth() - 10 * 2 - 10) / 2,120)
    static var DYRecommendCircleSize = CGSizeMake(DYUIUtils.ScreenWidth(), 150)
    static var DYRecommendSectionTitleSize = CGSizeMake(0, 40)
    static var DYRecommendHeaderReferenceSize = CGSizeMake(100, 40)
}

class DYRecommendCollectionView: UICollectionView {
    
    
    var layout:UICollectionViewFlowLayout{
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .Vertical
        layout.headerReferenceSize = RecommendUILayoutConfig.DYRecommendHeaderReferenceSize

        return layout
    }
    
    var testimageURLs:[String] = ["http://staticlive.douyutv.com/upload/signs/201602191051121376.jpg","http://staticlive.douyutv.com/upload/signs/201602191344241735.jpg","http://staticlive.douyutv.com/upload/signs/201602191258254209.jpg"];
    var data:[RecommendDataViewModel] = [RecommendDataViewModel]()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.defaultConfig()
    }
    
    func defaultConfig() {
        
        self.pagingEnabled = true
        self.showsHorizontalScrollIndicator = false
        self.bounces = true
        self.backgroundColor = UIColor.lightGrayColor()
        self.opaque = true
        self.collectionViewLayout = self.layout
        self.dataSource = self;
        self.delegate = self;
    }
}

extension DYRecommendCollectionView : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        guard indexPath.section != 0 else {
            
            let cell:DYCircleCell = collectionView.dequeueReusableCellWithReuseIdentifier(DYCircleCell.circleCellIdentifier, forIndexPath: indexPath) as! DYCircleCell
            cell.circleView.circleDelegate = self;
            return cell
            
        }
        
        let cell:DYRecommendCell = collectionView.dequeueReusableCellWithReuseIdentifier(DYRecommendCell.recommendCellIdentifier, forIndexPath: indexPath) as! DYRecommendCell
        
        let section = indexPath.section
        let cellViewModel = self.data[section - 1].roomList![indexPath.row]
        cell.cellViewModel = cellViewModel
        
        
        return cell
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        guard section != 0 else {
            
            return 1
        }
        return self.data[section - 1].roomList!.count
    }
    
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        let  headView : DYRecommendCollectionResusableView = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: DYRecommendCollectionResusableView.reusableViewID, forIndexPath: indexPath) as! DYRecommendCollectionResusableView
        
        guard indexPath.section == 0 else {
            
            headView.title.text = self.data[indexPath.section - 1].sectionTitle
            return headView
        }

        return headView
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return self.data.count + 1;
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize{
        
        guard section != 0 else {
            
            return CGSizeMake(0, 0)
        }
        return RecommendUILayoutConfig.DYRecommendSectionTitleSize
    }
    
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets{
        
        guard section != 0 else {
            
            return  UIEdgeInsetsMake(0, 0, 0, 0)
        }
        return UIEdgeInsetsMake(0, 10, 0, 10)
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize{
     
       //第一组的位置是轮播图
        guard indexPath.section != 0 else {
            
           return RecommendUILayoutConfig.DYRecommendCircleSize
        }
        return RecommendUILayoutConfig.DYRecommendItemSize
    }
}

//MARK: DDCircleViewDelegate

extension DYRecommendCollectionView: DDCircleViewDelegate {
    
    
    func numberOfItemsInCircleView(circleVIew: DDCircleView) -> Int {
        
        return self.testimageURLs.count;
    }
    
    
    func imagesOfCircleView(circleView: DDCircleView) -> NSArray {
        
        return testimageURLs;
    }
    
    func circleView(circleView: DDCircleView, didSelectedIndex: Int) {
        
    }
    
}

