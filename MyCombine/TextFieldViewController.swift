//
//  TextFieldViewController.swift
//  MyCombine
//
//  Created by SEUNG UN HAM on 2019/10/28.
//  Copyright © 2019 Kakao Mobility. All rights reserved.
//

import UIKit
import Combine

class TextFieldViewController: UIViewController {
    
    @IBOutlet private weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: textField)
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .sink { notification in
            if let tf = notification.object as? UITextField {
                print("hsteve tf.text \(tf.text!)")
            }
        }
    }
}
