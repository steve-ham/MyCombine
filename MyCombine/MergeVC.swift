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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        _ = Publishers.Merge(Just("a"), Just("b"))
            .sink { string in
                print("hsteve string \(string)")
        }
    }
}
