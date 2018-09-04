//
//  ViewController.swift
//  CheckList
//
//  Created by Mahmud Riad on 8/16/18.
//  Copyright © 2018 Shihab. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {

    var checklist: [CheckListItem]
    
    required init?(coder aDecoder: NSCoder) {
        
        checklist = [CheckListItem]()
        
        let itemOne = CheckListItem()
        itemOne.text = "Hello Mama"
        itemOne.isChecked = false
        checklist.append(itemOne)
        
        
        let itemTwo = CheckListItem()
        itemTwo.text = "Hello Mew..."
        itemTwo.isChecked = false
        checklist.append(itemTwo)
        
        
        let itemThree = CheckListItem()
        itemTwo.text = "Hello Mew..."
        itemTwo.isChecked = false
        checklist.append(itemThree)
        
        
        let itemFour = CheckListItem()
        itemTwo.text = "Hello Mew..."
        itemTwo.isChecked = false
        checklist.append(itemFour)
        
        super.init(coder: aDecoder)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return checklist.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       if let cell = tableView.cellForRow(at: indexPath){
        
        let item = checklist[indexPath.row]
        item.isChecked = !item.isChecked
    
        configureCheckMark(for: cell, with: item)
        
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        
        let label = cell.viewWithTag(1000) as! UILabel

        let item = checklist[indexPath.row]
        label.text = item.text
        
        configureCheckMark(for: cell, with : item)
        
        return cell
        
    }
    
    func configureCheckMark(for cell: UITableViewCell, with item: CheckListItem) {
        
        if item.isChecked{
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
        
    }

}

