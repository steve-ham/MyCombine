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
    
    private var cs = [AnyCancellable]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        let c = Publishers.Sequence(sequence: [1, 2, 3])
            .sink { number in
                print("hsteve number \(number)")
        }
        
        cs.append(c)
    }
}
