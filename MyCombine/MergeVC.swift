//
//  MergeVC.swift
//  MyCombine
//
//  Created by Steve Ham on 2019/11/18.
//  Copyright © 2019 Kakao Mobility. All rights reserved.
//

import UIKit
import Combine

class MergeVC: UIViewController {
    
    private var cs = [AnyCancellable]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        let c = Publishers.Merge(Just("a"), Just("b"))
            .sink { string in
                print("hsteve string \(string)")
        }
        
        cs.append(c)
    }
}
