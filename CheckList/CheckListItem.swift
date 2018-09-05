//
//  CheckListItem.swift
//  CheckList
//
//  Created by Mahmud Riad on 8/20/18.
//  Copyright © 2018 Shihab. All rights reserved.
//

import Foundation
class CheckListItem {
    
    var text = ""
    var isChecked  = false
    
    func toogle() {
        isChecked = !isChecked
    }
}
