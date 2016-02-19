//
//  RecommendModel.swift
//  DouyuTV
//
//  Created by lovelydd on 16/1/20.
//  Copyright © 2016年 xiaomutou. All rights reserved.
//

import Foundation
import ObjectMapper
import SwiftyJSON


struct Room {
    var roomID : String?
    var roomThumbImage : String?
    var nickName: String?
    var roomName: String?
    var vistor: Int?
    
    init(data: Dictionary <String, JSON>) {
        
        self.roomID = data["room_id"]?.stringValue
        self.roomThumbImage = data["room_src"]?.stringValue
        self.nickName = data["nickname"]?.stringValue
        self.roomName = data["room_name"]?.stringValue
        self.vistor = data["online"]?.intValue
    }
}

struct Recommend {
    
    var title : String?
    var cateID: String?
    var roomList:[Room]?
    
    init (data: Dictionary<String, JSON>) {

        self.title = data["title"]?.stringValue
        self.cateID = data["cate_id"]?.stringValue
        var rooms = [Room]()
        data["roomlist"]?.array?.forEach{
            
            let room = Room(data: $0.dictionaryValue)
            rooms.append(room)
        }
        self.roomList = rooms
    }
}

struct RecommendAd {
    
    var title: String?
    var adImageURL: String?
    

    init(data: Dictionary<String, JSON>) {
    
        self.title = data["title"]?.stringValue
        self.adImageURL = data["pic_url"]?.stringValue
    }
}





func recommendList(json: JSON) -> [Recommend] {
    
    var recommendModels = [Recommend]()
    
    json["data"].array?.forEach{
        
        let recommend = Recommend(data: $0.dictionaryValue)
        recommendModels.append(recommend)
    }
    return recommendModels
}


func recommendADList(json: JSON) -> [RecommendAd] {

    var recommendAds = [RecommendAd]()
    json["data"].array?.forEach{
        
        let ad = RecommendAd(data: $0.dictionaryValue)
        recommendAds.append(ad)
    }
    return recommendAds
}




struct RecommendDataRequest {
    
    
    
}

struct RecommendDataResponse {
    
    var recommendList:[Recommend] = [Recommend]()
}

struct RecommendAdDataResponse {
    var recommendAdList : [RecommendAd] = [RecommendAd]()
}

struct RecommendDataViewModel {

    var sectionTitle : String?
    var roomList:[RecommendDataCellModel]? = [RecommendDataCellModel]()
}

struct RecommendAdDataViewMode {
    
    var circleViewTitle: String?
    var circleViewImageViewURL: String?
}

struct RecommendDataCellModel {
    
    var roomImageUrl: String?
    var nickName: String?
    var roomName: String?
    var vistorCount: String?
}