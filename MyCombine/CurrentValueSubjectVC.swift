//
//  CurrentValueSubjectVC.swift
//  MyCombine
//
//  Created by Steve Ham on 2019/11/18.
//  Copyright © 2019 Kakao Mobility. All rights reserved.
//

import UIKit
import Combine

class CurrentValueSubjectVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        // BehaviorSubject

        let subject = CurrentValueSubject<String, Never>("string1")
        subject.sink { string in
            print("hsteve string \(string)")
        }

        subject.send("hello")

        print("hsteve subject.value \(subject.value)")
    }
}
