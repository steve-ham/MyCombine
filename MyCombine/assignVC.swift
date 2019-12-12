//
//  assignVC.swift
//  MyCombine
//
//  Created by Steve Ham on 2019/11/18.
//  Copyright © 2019 Kakao Mobility. All rights reserved.
//

import UIKit
import Combine

class assignVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        // bind

        class MyClass {
            private var string = ""
            private var cs = [AnyCancellable]()
            
            init() {
                let c = Just("hello")
                .assign(to: \.string, on: self)
                cs.append(c)
            }
            
            func sayHello() {
                print("hsteve string \(string)")
            }
        }

        let myClass = MyClass()

        myClass.sayHello()
    }
}
