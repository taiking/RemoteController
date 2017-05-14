//
//  AirConditionerViewModel.swift
//  RemoteController
//
//  Created by chocovayashi on 2017/04/20.
//  Copyright © 2017年 chocovayashi. All rights reserved.
//

import Foundation
import APIKit

class AirConditionerViewModel {
    let errorMessage: String?
    let status: String?
    
    init(object: Any) throws {
        guard let dictionary = object as? [String: Any] else {
                throw ResponseError.unexpectedObject(object)
        }
        
        self.errorMessage = dictionary["message"] as! String?
        self.status = dictionary["status"] as! String?
    }
}
