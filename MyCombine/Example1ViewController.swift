//
//  Example1ViewController.swift
//  MyCombine
//
//  Created by Steve Ham on 2019/11/13.
//  Copyright © 2019 Kakao Mobility. All rights reserved.
//

import UIKit
import Combine

class Wizard {
    var grade: Int
    init(grade: Int) {
        self.grade = grade
    }
}

class Example1ViewController: UIViewController {
    
    let merlin = Wizard(grade: 0)
    var myGrade = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let graduationPublisher = NotificationCenter.Publisher(center: .default, name: .graduated, object: nil)
            .map { n -> Int in
                return n.object as? Int ?? 0
        }
        
        let gradeSubscriber = Subscribers.Assign(object: merlin, keyPath: \.grade)
        
        graduationPublisher.subscribe(gradeSubscriber)
    }
    
    
    @IBAction private func clickButton(_ sender: UIButton) {
        myGrade += 1
        NotificationCenter.default.post(name: .graduated, object: myGrade)
        
        print("hsteve merlin.grade \(merlin.grade)")
    }
}

extension NSNotification.Name {
    static let graduated = NSNotification.Name("graduated")
}
