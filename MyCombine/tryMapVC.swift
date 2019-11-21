//
//  tryMapVC.swift
//  MyCombine
//
//  Created by Steve Ham on 2019/11/21.
//  Copyright © 2019 Kakao Mobility. All rights reserved.
//

import UIKit
import Combine

class tryMapVC: UIViewController {
    
    enum MyError: Error {
        case myUnknown
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        _ = Just(2)
            .tryMap { number -> String in
                if number == 3 {
                    throw MyError.myUnknown
                } else {
                    return "\(number)"
                }
        }.sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                break
            case .failure(let error):
                print("hsteve error.localizedDescription \(error)")
            }
        }, receiveValue: { string in
            print("hsteve string \(string)")
        })
    }
}



