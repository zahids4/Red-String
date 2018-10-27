//
//  AddStringModalViewController.swift
//  Red String
//
//  Created by Saim Zahid on 2018-10-27.
//  Copyright © 2018 Saim Zahid. All rights reserved.
//

import UIKit
import CoreData

class AddStringModalViewController: UIViewController {
    @IBOutlet weak var nameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func addNewString(_ sender: Any) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let newString = StringObject(context: managedContext)
        newString.name = nameField.text
        appDelegate.saveContext()
        navigationController?.popViewController(animated: true)
    }
}
