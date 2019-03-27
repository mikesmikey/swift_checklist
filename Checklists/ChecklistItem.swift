//
//  ChecklistItem.swift
//  Checklists
//
//  Created by informatics on 20/2/2562 BE.
//  Copyright © 2562 informatics. All rights reserved.
//

import Foundation

class ChecklistItem: NSObject {
    var text = ""
    var checked = false
    
    func toggleChecked() {
        checked = !checked
    }
    
}
