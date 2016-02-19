//
//  RecommendWorker.swift
//  DouyuTV
//
//  Created by lovelydd on 16/1/20.
//  Copyright © 2016年 xiaomutou. All rights reserved.
//

import Foundation
import Moya
import SwiftyJSON


protocol RecommendWorker {
    
    
    func fetchRecommendData(success:((data: RecommendDataResponse) -> Void), fail: ((error: ErrorType?) -> Void))
    
    func fetchRecommendAdData(success:((data: RecommendAdDataResponse) -> Void), fail: ((error: ErrorType?) -> Void))
}

struct RecommendAPIWorker: RecommendWorker {
    
    
    func fetchRecommendData(success:((data: RecommendDataResponse) -> Void), fail: ((error: ErrorType?) -> Void)) {

        DouyuProvider.request(.Recommend, completion: { result in
            
            switch result {
            case .Success(let response):
                do {
                    let json = JSON(data: response.data)
                    let recommends = recommendList(json)
                    success(data: RecommendDataResponse(recommendList:recommends))
                    
                } catch {
                    
                }
            case .Failure(let error):
               
                print(error)
            }
        })
    }
    
    func fetchRecommendAdData(success:((data: RecommendAdDataResponse) -> Void), fail: ((error: ErrorType?) -> Void)) {
        
        DouyuProvider.request(.RecommendBanner) { (result) -> () in
         
            switch result {
            case .Success(let response):
                do {
                    let json = JSON(data: response.data)
                    let recommendAds = recommendADList(json)
                    print("RecommendBanner response ：\(recommendAds)")
                    success(data: RecommendAdDataResponse(recommendAdList: recommendAds))
                    
                } catch {
                    
                }
            case .Failure(let error):
                
                print(error)
            }
        }
    }

}




