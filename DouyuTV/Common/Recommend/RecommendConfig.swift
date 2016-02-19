//
//  RecommendConfig.swift
//  DouyuTV
//
//  Created by lovelydd on 16/1/20.
//  Copyright © 2016年 xiaomutou. All rights reserved.
//

import Foundation
import UIKit

protocol RecommendControllerToInteractorPipline {
    
    func refreshData(request: RecommendDataRequest)
    
    func refreshADData(request: RecommendDataRequest)
    
}

protocol RecommendInteractorToPresenterPipline {
    
    func presentData(response: RecommendDataResponse)
//    func presentAdData(response: RecommendAdDataResponse)
    
}

protocol RecommendPresenterToViewControllerPipline: class {
    
    func displayData(viewModels: [RecommendDataViewModel])
//    func displayAdData(viewModels:)
    
    
}

