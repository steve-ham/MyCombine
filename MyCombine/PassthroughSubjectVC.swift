//
//  PassthroughSubjectVC.swift
//  MyCombine
//
//  Created by Steve Ham on 2019/11/18.
//  Copyright © 2019 Kakao Mobility. All rights reserved.
//

import UIKit
import Combine

class PassthroughSubjectVC: UIViewController {
    
    private var cs = [AnyCancellable]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        // PublishSubject

        let subject = PassthroughSubject<String, Never>()
        let c = subject.sink { string in
            print("hsteve string \(string)")
        }
        cs.append(c)

        subject.send("hello")
    }
}
