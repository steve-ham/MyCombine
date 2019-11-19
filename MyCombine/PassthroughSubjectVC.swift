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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        // PublishSubject

        let subject = PassthroughSubject<String, Never>()
        subject.sink { string in
            print("hsteve string \(string)")
        }

        subject.send("hello")
    }
}
