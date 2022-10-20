//
//  MovieAPI.swift
//  MovieTestingApp
//
//  Created by Escurra Colquis on 15/10/22.
//

import Foundation
import SwiftyJSON
import Alamofire

enum TypeApi {
    case upcoming
    case topRated
    case popular
}

enum ResponseResult {
    case success(result: JSON)
    case failure(NSError)
}

struct ResponseCode {
    static var loginAgain = 404
    static var success = 200
    static var permissionDenied = 401
}

class HeaderAPI: NSObject {
    class func headers() -> HTTPHeaders {
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
        return headers
    }
}
