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
    
    private var cs = [AnyCancellable]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        let c1 = Publishers.Zip($switchAIsOn, $switchBIsOn) // 둘다 짝 맞게 들어와야 emit 됨
            .receive(on: RunLoop.current)
            .map { $0 && $1 }
            .sink { bool in
                print("hsteve Zip \(bool)")
        }
        cs.append(c1)
        
        let c2 = Publishers.CombineLatest($switchAIsOn, $switchBIsOn) // 하나만 들어와도 emit 됨
            .receive(on: RunLoop.current)
            .map { $0 && $1 }
            .sink { string in
                print("hsteve CombineLatest \(string)")
        }
        cs.append(c2)
    }
    
    @IBAction private func toggleSwitchA(_ sender: UISwitch) {
        switchAIsOn = sender.isOn
    }
    
    @IBAction private func toggleSwitchB(_ sender: UISwitch) {
        switchBIsOn = sender.isOn
    }
}
