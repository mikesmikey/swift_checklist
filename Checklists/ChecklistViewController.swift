//
//  ViewController.swift
//  Checklists
//
//  Created by student on 13/2/2562 BE.
//  Copyright © 2562 informatics. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController, ItemDetailViewControllerDelegate {
    func ItemDetailViewControllerDidCancel(_ controller: ItemDetailViewController) {
        navigationController?.popViewController(animated:true)
    }
    
    func ItemDetailViewController(
        _ controller: ItemDetailViewController,
        didFinishAdding item: ChecklistItem) {
        let newRowIndex = items.count
        items.append(item)
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        navigationController?.popViewController(animated:true)
    }
    
    func ItemDetailViewController(
        _ controller: ItemDetailViewController,
        didFinishEditing item: ChecklistItem) {
        if let index = items.index(of: item) {
            let indexPath = IndexPath(row: index, section: 0)
            if let cell = tableView.cellForRow(at: indexPath) {
                configureText(for: cell, with: item)
            }
        }
        navigationController?.popViewController(animated:true)
    }
    
    var items = [ChecklistItem]()
    
    let row0item = ChecklistItem()
    let row1item = ChecklistItem()
    let row2item = ChecklistItem()
    let row3item = ChecklistItem()
    let row4item = ChecklistItem()
    
    var row0checked = true
    var row1checked = false
    var row2checked = true
    var row3checked = false
    var row4checked = true
    var isChecked = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /*
        row0item.text = "Walk the dog"
        
        row1item.text = "Brush my teeth"
        row1item.checked = true
        
        row2item.text = "Learn i0s development"
        row2item.checked = true
        
        row3item.text = "Soccer pratice"
        
        row4item.text = "Eat ice cream"
        row4item.checked = true
        */
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let item0 = ChecklistItem()
        item0.text = "Walk the dog"
        items.append(item0)
        
        let item1 = ChecklistItem()
        item1.text = "Brush my teeth"
        item1.checked = true
        items.append(item1)
        
        let item2 = ChecklistItem()
        item2.text = "Learn i0s development"
        items.append(item2)
        
        let item3 = ChecklistItem()
        item3.text = "Soccer pratice"
        item3.checked = true
        items.append(item3)
        
        let item4 = ChecklistItem()
        item4.text = "Eat ice cream"
        item4.checked = true
        items.append(item4)
        
        let item5 = ChecklistItem()
        item5.text = "my name jeff"
        item5.checked = true
        items.append(item5)
        
    }
    //TableView Data Source(Data source Protocol)
    override func tableView(_ tableView: UITableView,numberOfRowsInSection section: Int) -> Int {
        //จำนวนข้อมูลท่ี่แสดง
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath){
            let item = items[indexPath.row]
            item.toggleChecked()	
            
            /*
            if indexPath.row == 0 {
                row0checked = !row0checked
                isChecked = row0checked
            } else if indexPath.row == 1 {
                row1checked = !row1checked
                isChecked = row1checked
            } else if indexPath.row == 2 {
                row2checked = !row2checked
                isChecked = row2checked
            }else if indexPath.row == 3 {
                row3checked = !row3checked
                isChecked = row3checked
            }else if indexPath.row == 4 {
                row4checked = !row4checked
               isChecked = row4checked
            }
            
            if isChecked {
                cell.accessoryType = .checkmark
            }else{
                cell.accessoryType = .none
            }
            */
            configureCheckmark(for: cell, with: item)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func configureCheckmark(for cell: UITableViewCell, with item: ChecklistItem) {
            let label = cell.viewWithTag(1001) as! UILabel
            
            if item.checked {
                label.text = "✅"
            } else {
                label.text = ""
            }
    }
    
    func configureText (for cell: UITableViewCell, with item: ChecklistItem) {
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }
    
    override func tableView(_ tableView: UITableView,cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem",for : indexPath)
        //let label = cell.viewWithTag(1000) as! UILabel
        
        let item = items[indexPath.row]
        
        configureText(for: cell, with: item)
        
        configureCheckmark(for: cell, with: item)
        return cell
    }
    
    override func tableView( _ tableView: UITableView,
                             commit editingStyle: UITableViewCell.EditingStyle,
                             forRowAt indexPath: IndexPath
        ) {
        items.remove(at: indexPath.row)
        
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }
    
    override func prepare(for segue: UIStoryboardSegue,
                          sender: Any?) {
        // 1
        if segue.identifier == "AddItem" {
            // 2
            let controller = segue.destination
                as! ItemDetailViewController
            // 3
            controller.delegate = self
        } else if segue.identifier == "EditItem" {
            let controller = segue.destination as! ItemDetailViewController
                controller.delegate = self
            if let indexPath = tableView.indexPath(for: sender as! UITableViewCell) {
                controller.itemToEdit = items[indexPath.row]
            }
        }
    }
}

