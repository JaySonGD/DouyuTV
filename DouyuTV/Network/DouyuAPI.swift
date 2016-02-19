//
//  DouyuAPI.swift
//  DouyuTV
//
//  Created by lovelydd on 16/1/20.
//  Copyright © 2016年 xiaomutou. All rights reserved.
//

import Foundation
import Moya

// MARK: - Provider setup

let DouyuProvider = MoyaProvider<Douyu>()

let DouyuBaseURL = "http://www.douyutv.com"

let DYRecommendURL = "/api/v1/channel"

let DYRecommendBannerURL = "\(DouyuBaseURL)/api/v1/slide/6"


// MARK: - Provider support

private extension String {
    var URLEscapedString: String {
        return self.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLHostAllowedCharacterSet())!
    }
}

public enum Douyu {
    case Recommend
    case RecommendBanner
    case UserRepositories(String)
}

extension Douyu: TargetType {
    public var baseURL: NSURL { return NSURL(string: DouyuBaseURL)! }
    public var path: String {
        switch self {
        case .Recommend:
            return DYRecommendURL
        case .RecommendBanner:
            return DYRecommendBannerURL
        case .UserRepositories(let name):
            return "/users/\(name.URLEscapedString)/repos"
        }
    }
    
    public var method: Moya.Method {
        return .GET
    }
    
    
    public var parameters: [String: AnyObject]? {
        switch self {
        case .Recommend:
            return ["aid": "ios"]
        case .RecommendBanner:
            return ["aid":"ios"]
        default:
            return nil
        }
    }
    
    public var sampleData: NSData {
        switch self {
        case .Recommend:
            return "Half measures are as bad as nothing at all.".dataUsingEncoding(NSUTF8StringEncoding)!
        case .RecommendBanner(let name):
            return "{\"login\": \"\(name)\", \"id\": 100}".dataUsingEncoding(NSUTF8StringEncoding)!
        case .UserRepositories(_):
            return "[{\"name\": \"Repo Name\"}]".dataUsingEncoding(NSUTF8StringEncoding)!
        }
    }
}
