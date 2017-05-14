//
//  BaseRequest.swift
//  RemoteController
//
//  Created by chocovayashi on 2017/04/20.
//  Copyright © 2017年 chocovayashi. All rights reserved.
//

import Foundation
import APIKit

protocol BaseRequest: Request { }

extension BaseRequest {
    var baseURL: URL {
        // WANのグローバルIPアドレスと指定
        return URL(string: "http://000.000.000.000")!
    }
    
    func intercept(urlRequest: URLRequest) throws -> URLRequest {
        var urlRequest = urlRequest
        urlRequest.timeoutInterval = 3
        return urlRequest
    }
}
