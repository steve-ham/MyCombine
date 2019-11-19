//
//  eraseToAnyPublisherVC.swift
//  MyCombine
//
//  Created by Steve Ham on 2019/11/19.
//  Copyright © 2019 Kakao Mobility. All rights reserved.
//

import UIKit
import Combine

class eraseToAnyPublisherVC: UIViewController {
    
    @IBOutlet private weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        _ = textField.textPublisher.sink { (text) in
            print("hsteve text \(text)")
        }
    }
}

extension UITextField {
    var textPublisher: AnyPublisher<String, Never> {
        NotificationCenter.default
            .publisher(for: UITextField.textDidChangeNotification, object: self)
            .receive(on: RunLoop.current)
            .compactMap { $0.object as? UITextField } // receiving notifications with objects which are instances of UITextFields
            .map { $0.text ?? "" } // mapping UITextField to extract text
            .eraseToAnyPublisher()
    }
}
