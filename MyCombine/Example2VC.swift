//
//  Example2VC.swift
//  MyCombine
//
//  Created by Steve Ham on 2019/11/19.
//  Copyright © 2019 Kakao Mobility. All rights reserved.
//

import UIKit
import Combine

struct Example2Data: Codable {
    let title: String
}

class Example2VC: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Example 1
//        _ = NotificationCenter.default.publisher(for: .newTrickDownloaded)
//            .map { $0.userInfo?["data"] as! Data }
//            .decode(type: Example2Data.self, decoder: JSONDecoder())
//            .catch { _ in Just(Example2Data(title: "Title2")) }
//            .receive(on: RunLoop.current)
//            .sink(receiveValue: { example2Data in
//                print("hsteve version1 \(example2Data)")
//            })
        
        // Example 2
        _ = NotificationCenter.default.publisher(for: .newTrickDownloaded)
            .map { $0.userInfo?["data"] as! Data }
            .flatMap({ data in
                Just(data)
                    .decode(type: Example2Data.self, decoder: JSONDecoder())
                    .catch { _ in Just(Example2Data(title: "Title2")) }
            })
            .receive(on: RunLoop.current)
            .sink(receiveValue: { example2Data in
                print("hsteve version2 \(example2Data)")
            })
    }
    
    
    @IBAction private func clickButton(_ sender: UIButton) {
        let data = try! JSONEncoder().encode(Example2Data(title: "Title1"))
        NotificationCenter.default.post(name: .newTrickDownloaded, object: nil, userInfo: ["data": data])
    }
    
}

extension NSNotification.Name {
    static let newTrickDownloaded = NSNotification.Name("newTrickDownloaded")
}
