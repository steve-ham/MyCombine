//
//  subscribeAndReceiveVC.swift
//  MyCombine
//
//  Created by Steve Ham on 2019/11/19.
//  Copyright © 2019 Kakao Mobility. All rights reserved.
//

import UIKit
import Combine

class subscribeAndReceiveVC: UIViewController {
    
    private var cs = [AnyCancellable]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        let c = Just(3)
            .handleEvents(receiveOutput: { _ in
                print("hsteve handleEvents isMainThread \(Thread.isMainThread)")
            })
            .subscribe(on: DispatchQueue.global())
            .receive(on: RunLoop.main)
            .sink { number in
                print("hsteve sink isMainThread \(Thread.isMainThread)")
        }
        cs.append(c)
    }
}
