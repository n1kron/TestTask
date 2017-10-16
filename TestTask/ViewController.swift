//
//  ViewController.swift
//  TestTask
//
//  Created by 123 on 14.10.17.
//  Copyright © 2017 Zarubin. All rights reserved.
//

import UIKit

extension UIViewController
{
    func hideKeyboard()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
    
    func shadowContainer() {
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize.zero
        }
    }

class ViewController: UIViewController  {

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
