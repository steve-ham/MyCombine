//
//  PublishersSequenceVC.swift
//  MyCombine
//
//  Created by Steve Ham on 2019/11/18.
//  Copyright © 2019 Kakao Mobility. All rights reserved.
//

import UIKit
import Combine

class PublishersSequenceVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        Publishers.Sequence(sequence: [1, 2, 3])
            .sink { number in
                print("hsteve number \(number)")
        }
    }
}
