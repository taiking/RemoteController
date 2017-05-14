//
//  PostAirConditioner.swift
//  RemoteController
//
//  Created by chocovayashi on 2017/04/20.
//  Copyright © 2017年 chocovayashi. All rights reserved.
//

import APIKit

struct PostAirConditioner: BaseRequest {

    typealias Response = AirConditionerViewModel
    
    var value: String
    
    var method: HTTPMethod {
        return .post
    }
    
    var parameters: Any? {
        return ["value": self.value]
    }
    
    var path: String {
        return "/"
    }
    
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> AirConditionerViewModel {
        return try AirConditionerViewModel(object: object)
    }
}
