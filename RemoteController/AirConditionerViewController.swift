//
//  AirConditionerViewController.swift
//  RemoteController
//
//  Created by chocovayashi on 2017/04/20.
//  Copyright © 2017年 chocovayashi. All rights reserved.
//

import UIKit
import APIKit
import RxSwift
import RxCocoa
import SVProgressHUD

class AirConditionerViewController: UIViewController {
    
    @IBOutlet weak var stopButton: UIButton!
    
    @IBOutlet weak var coolButton: UIButton!
    
    @IBOutlet weak var heatButton: UIButton!
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        subscribe()
    }
    
    func subscribe() {
        stopButton.rx.tap
            .subscribe(onNext: { [unowned self] _ in
                SVProgressHUD.show()
                Session.rx_sendRequest(request: PostAirConditioner(value: "stop"))
                    .subscribe(onNext: { result in
                        self.response(result: result)
                    }, onError: { error in
                        SVProgressHUD.showError(withStatus: "error")
                    }).addDisposableTo(self.disposeBag)
        }).addDisposableTo(disposeBag)
        
        coolButton.rx.tap
            .subscribe(onNext: { [unowned self] _ in
                SVProgressHUD.show()
                Session.rx_sendRequest(request: PostAirConditioner(value: "cool"))
                    .subscribe(onNext: { result in
                        self.response(result: result)
                    }, onError: { error in
                        SVProgressHUD.showError(withStatus: "error")
                    }).addDisposableTo(self.disposeBag)
            }).addDisposableTo(disposeBag)
        
        heatButton.rx.tap
            .subscribe(onNext: { [unowned self] _ in
                SVProgressHUD.show()
                Session.rx_sendRequest(request: PostAirConditioner(value: "heat"))
                    .subscribe(onNext: { result in
                        self.response(result: result)
                    }, onError: { error in
                        SVProgressHUD.showError(withStatus: "error")
                    }).addDisposableTo(self.disposeBag)
            }).addDisposableTo(disposeBag)
    }
    
    func response(result: AirConditionerViewModel) {
        if result.errorMessage == nil {
            SVProgressHUD.showSuccess(withStatus: "success " + result.status!)
        } else {
            SVProgressHUD.showSuccess(withStatus: result.errorMessage!)
        }
    }
}
