//
//  ViewController.swift
//  MyCombine
//
//  Created by SEUNG UN HAM on 2019/10/28.
//  Copyright © 2019 Kakao Mobility. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    let viewControllers = [UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "TextFieldViewController") as! TextFieldViewController,
                           UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "Example1VC") as! Example1VC,
                           UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "eraseToAnyPublisherVC") as! eraseToAnyPublisherVC,
                           MergeVC(), CurrentValueSubjectVC(), PublishersSequenceVC(), PassthroughSubjectVC(), assignVC()]

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
}

extension NSObject {
    private static var describingSelf: String {
        return String(describing: self)
    }
    
    var name: String {
        return String(describing: type(of: self).describingSelf)
    }
}
