//
//  RecommendPresenter.swift
//  DouyuTV
//
//  Created by lovelydd on 16/1/21.
//  Copyright © 2016年 xiaomutou. All rights reserved.
//

import Foundation

typealias RecommendPresenterInput = RecommendInteractorToPresenterPipline
typealias RecommendPresenterOutput = RecommendPresenterToViewControllerPipline

class RecommendPresenter {

    var output: RecommendPresenterOutput!
    
}
extension RecommendPresenter: RecommendPresenterInput {
    
    func presentData(response: RecommendDataResponse) {
        
        var viewModels:[RecommendDataViewModel] = [RecommendDataViewModel]()
        response.recommendList.forEach{
            
            var roomList:[RecommendDataCellModel] = [RecommendDataCellModel]()
            
            $0.roomList?.forEach {
                
                var cellModel = RecommendDataCellModel()
                cellModel.roomImageUrl = $0.roomThumbImage
                cellModel.nickName = $0.nickName
                cellModel.roomName = $0.roomName
                if $0.vistor < 10000 {
                    
                    cellModel.vistorCount = "\($0.vistor!)"
                } else {
                    
                    let count = $0.vistor! / 10000.0
                    
                    cellModel.vistorCount = "\(String(format: "%.1f", count)) 万";
                }
                roomList.append(cellModel)
            }
            let viewModel = RecommendDataViewModel(sectionTitle: $0.title ,roomList:roomList)
            viewModels.append(viewModel)
        }
        output.displayData(viewModels)
    }
    
}
