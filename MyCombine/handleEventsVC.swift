//
//  handleEventsVC.swift
//  MyCombine
//
//  Created by Steve Ham on 2019/11/19.
//  Copyright © 2019 Kakao Mobility. All rights reserved.
//

import UIKit
import Combine

class handleEventsVC: UIViewController {
    
    private var cs = [AnyCancellable]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        let c = Just(3)
            .handleEvents(receiveOutput: { number in
                print("hsteve handleEvents \(number)")
            })
            .sink { number in
                print("hsteve sink \(number)")
        }
        cs.append(c)
    }
}
