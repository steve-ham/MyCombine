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
            var string = ""
            init() {
                _ = Just("hello")
                .assign(to: \.string, on: self)
            }
            
            func sayHello() {
                print("hsteve string \(string)")
            }
        }

        let myClass = MyClass()

        myClass.sayHello()
    }
}
