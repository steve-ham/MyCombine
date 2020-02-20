//
//  ViewController.swift
//  MyCombine
//
//  Created by SEUNG UN HAM on 2019/10/28.
//  Copyright © 2019 Kakao Mobility. All rights reserved.
//

import UIKit
import Combine

// https://medium.com/gett-engineering/rxswift-to-apples-combine-cheat-sheet-e9ce32b14c5b

class TableViewController: UITableViewController {
    
    let viewControllers = [UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "TextFieldViewController") as! TextFieldViewController,
                           UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "Example1VC") as! Example1VC,
                           UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "Example2VC") as! Example2VC,
                           UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "eraseToAnyPublisherVC") as! eraseToAnyPublisherVC,
                           UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "ZipAndCombineLatestVC") as! ZipAndCombineLatestVC,
                           MergeVC(), CurrentValueSubjectVC(), PublishersSequenceVC(), PassthroughSubjectVC(), assignVC(), handleEventsVC(), subscribeAndReceiveVC(), tryMapVC()]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewControllers.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = viewControllers[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(viewControllers[indexPath.row], animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1
        let future = futureIncrement(integer: 1, afterDelay: 1)
        // 2
        _ = future
            .sink(receiveCompletion: { print($0) },
                  receiveValue: { print($0) })
    }
    
    func futureIncrement(integer: Int, afterDelay delay: TimeInterval) -> Future<Int, Never> {
        Future<Int, Never> { promise in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                print("hsteve asyncAfter")
                promise(.success(integer + 1))
            }
        }
    }


    

}

extension NSObject {
    private static var describingSelf: String {
        return String(describing: self)
    }
    
    var name: String {
        return String(describing: type(of: self).describingSelf)
    }
}
