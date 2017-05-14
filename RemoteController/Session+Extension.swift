//
//  Session+Extension.swift
//  RemoteController
//
//  Created by chocovayashi on 2017/04/20.
//  Copyright © 2017年 chocovayashi. All rights reserved.
//

import Foundation
import APIKit
import RxSwift

extension Session {
    func rx_sendRequest<T: Request>(request: T) -> Observable<T.Response> {
        return Observable.create { observer in
            let task = self.send(request) { result in
                switch result {
                case .success(let res):
                    observer.on(.next(res))
                    observer.on(.completed)
                case .failure(let err):
                    observer.onError(err)
                }
            }
            return Disposables.create { [weak task] in
                task?.cancel()
            }
        }
    }
    
    class func rx_sendRequest<T: Request>(request: T) -> Observable<T.Response> {
        return shared.rx_sendRequest(request: request)
    }
}
