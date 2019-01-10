//
//  StringsTableViewController.swift
//  Red String
//
//  Created by Saim Zahid on 2018-10-27.
//  Copyright © 2018 Saim Zahid. All rights reserved.
//

import UIKit

class StringsTableViewController: UITableViewController {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var strings = [StringObject]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getAllStrings()
        tableView.reloadData()
    }
    
    fileprivate func getAllStrings() {
        do {
            strings = try context.fetch(StringObject.fetchRequest())
        } catch {
            print("Fetching Failed")
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return strings.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stringCell", for: indexPath)

        let string = strings[indexPath.row]
        
        if let stringName = string.name {
            cell.textLabel?.text = stringName
            cell.detailTextLabel?.text = ""
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            let stringToDelete = strings[indexPath.row]
            context.delete(stringToDelete)
            do {
                try context.save()
                getAllStrings()
            } catch {
               //Error!
            }
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }
}
