//
//  RecommendController.swift
//  DouyuTV
//
//  Created by lovelydd on 16/1/14.
//  Copyright © 2016年 xiaomutou. All rights reserved.
//

import UIKit
import ObjectMapper
import SwiftyJSON


typealias RecommendControllerInput = RecommendPresenterToViewControllerPipline
typealias RecommendControllerOutput = RecommendControllerToInteractorPipline

class RecommendController: DYBaseViewController {

    
    var testimageURLs:[String] = [];
    
    @IBOutlet weak var recommendCollectionView: DYRecommendCollectionView!

    private(set) var output: RecommendControllerOutput!
    private(set) var data = [RecommendDataViewModel]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.setupRecommendViewControllerStyle()

        setupVIP();
        //加载推荐首页的数据
        let request = RecommendDataRequest()
        output?.refreshData(request)
        
        //加载推荐首页广告的数据
        output?.refreshADData(request)
        
//        let fatherView = FatherView()
//        fatherView.backgroundColor = UIColor.redColor()
//        fatherView.frame = CGRectMake(0, 0, 20, 20)
//        self.view.addSubview(fatherView)
//        
        
//        let sonView = SonView()
//        sonView.backgroundColor = UIColor.greenColor()
//        sonView.frame = CGRectMake(0, 0, 10, 10)
//        fatherView.addSubview(sonView)
    }
    
    private func setupVIP() {

        let interactor = RecommendInteractor()
        let present     = RecommendPresenter()
        self.output = interactor
        interactor.output = present
        present.output = self
    }
    
    deinit {
        print("RecommendController Deinit",
            ObjectIdentifier(self).uintValue)
    }
}


extension RecommendController: RecommendPresenterToViewControllerPipline {
    
    func displayData(viewModels: [RecommendDataViewModel]) {
        
        data.removeAll()
        viewModels.forEach {    data.append($0) }
        //更新数据
        self.recommendCollectionView.data = data
        self.recommendCollectionView.reloadData()
    }
}
