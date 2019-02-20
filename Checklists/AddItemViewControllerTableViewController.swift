//
//  AddItemViewControllerTableViewController.swift
//  Checklists
//
//  Created by informatics on 20/2/2562 BE.
//  Copyright © 2562 informatics. All rights reserved.
//

import UIKit

class AddItemViewControllerTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func back() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func done() {
        navigationController?.popViewController(animated: true)
    }
}
