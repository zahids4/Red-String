//
//  AddStringModalViewController.swift
//  Red String
//
//  Created by Saim Zahid on 2018-10-27.
//  Copyright © 2018 Saim Zahid. All rights reserved.
//

import UIKit

class AddStringModalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    } 

    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
