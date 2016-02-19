//
//  RecommendInteractor.swift
//  DouyuTV
//
//  Created by lovelydd on 16/1/21.
//  Copyright © 2016年 xiaomutou. All rights reserved.
//

import Foundation
import SwiftyJSON

typealias RecommendInteractorInput = RecommendControllerToInteractorPipline
typealias RecommendInteractorOutput = RecommendInteractorToPresenterPipline

class RecommendInteractor {
    
    var output : RecommendInteractorOutput!
    var worker: RecommendWorker = RecommendAPIWorker()

}

extension RecommendInteractor : RecommendInteractorInput {
    
    func refreshData(request: RecommendDataRequest) {
        
        worker.fetchRecommendData({ (data) -> Void in
            
            self.output.presentData(data)
            
            }) { (error) -> Void in
        }
    }
    
    func refreshADData(request: RecommendDataRequest) {
    
        worker.fetchRecommendAdData({ (data) -> Void in
            
//            self.output.presentAdData(data)
            }) { (error) -> Void in
        }
    }
    
    
//    func sendResponseDataToPresenter(data: RecommendDataResponse) {
//    
//        self.output.presentData(data)
//    }
}



