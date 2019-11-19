//
//  ZipAndCombineLatestVC.swift
//  MyCombine
//
//  Created by Steve Ham on 2019/11/19.
//  Copyright © 2019 Kakao Mobility. All rights reserved.
//

import UIKit
import Combine

class ZipAndCombineLatestVC: UIViewController {
    
    @Published var switchAIsOn = false
    @Published var switchBIsOn = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        _ = Publishers.Zip($switchAIsOn, $switchBIsOn) // 둘다 짝 맞게 들어와야 emit 됨
            .receive(on: RunLoop.current)
            .map { $0 && $1 }
            .sink { bool in
                print("hsteve Zip \(bool)")
        }
        
        _ = Publishers.CombineLatest($switchAIsOn, $switchBIsOn) // 하나만 들어와도 emit 됨
            .receive(on: RunLoop.current)
            .map { $0 && $1 }
            .sink { string in
                print("hsteve CombineLatest \(string)")
        }
    }
    
    @IBAction private func toggleSwitchA(_ sender: UISwitch) {
        switchAIsOn = sender.isOn
    }
    
    @IBAction private func toggleSwitchB(_ sender: UISwitch) {
        switchBIsOn = sender.isOn
    }
}
