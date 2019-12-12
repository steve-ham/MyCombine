//
//  Example1VC.swift
//  MyCombine
//
//  Created by Steve Ham on 2019/11/13.
//  Copyright © 2019 Kakao Mobility. All rights reserved.
//

import UIKit
import Combine

class Student {
    var grade: Int
    init(grade: Int) {
        self.grade = grade
    }
}

class Example1VC: UIViewController {
    
    let student = Student(grade: 0)
    var myGrade = 0
    private var cs = [AnyCancellable]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("hsteve Example1VC")
        // Version 1
//        let graduationPublisher = NotificationCenter.Publisher(center: .default, name: .graduated, object: nil)
//
//        let converter = Publishers.Map(upstream: graduationPublisher) { notification in
//            notification.userInfo?["NewGrade"] as? Int ?? 0
//        }
//
//        let gradeSubscriber = Subscribers.Assign(object: student, keyPath: \.grade)
//
//        converter.subscribe(gradeSubscriber)
        
        
        // Version 2
//        let c1 = NotificationCenter.default.publisher(for: .graduated, object: nil)
//            .map { $0.userInfo?["NewGrade"] as? Int ?? 0 }
//            .receive(on: RunLoop.current)
//            .assign(to: \.grade, on: student)
//        cs.append(c1)
        
        // Version 3
        let c2 = NotificationCenter.default.publisher(for: .graduated, object: nil)
            .compactMap { $0.userInfo?["NewGrade"] as? Int } // Prevents going further down the stream
            .filter { $0 >= 3 }
            .prefix(3) // After receiving 3, cancel upstream and send completion to downstream.
            .receive(on: RunLoop.current)
            .assign(to: \.grade, on: student)
        cs.append(c2)
    }
    
    @IBAction private func clickButton(_ sender: UIButton) {
        myGrade += 1
        NotificationCenter.default.post(name: .graduated, object: nil, userInfo: ["NewGrade": myGrade])
        
        print("hsteve student.grade \(student.grade)")
    }
}

extension NSNotification.Name {
    static let graduated = NSNotification.Name("graduated")
}
