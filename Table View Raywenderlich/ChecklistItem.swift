//
//  ChecklistItem.swift
//  Table View Raywenderlich
//
//  Created by yash on 19/07/19.
//  Copyright © 2019 yash. All rights reserved.
//

import Foundation

class ChecklistItem: NSObject {
    
    @objc var text = ""
    var checked = false
    
    func toggleChecked() {
        checked = !checked
    }
}
