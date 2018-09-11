//
//  ViewController.swift
//  CheckList
//
//  Created by Mahmud Riad on 8/16/18.
//  Copyright © 2018 Shihab. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController , AddItemViewControllerProtocol {
    
    func addItemViewControllerDidCancel(_ controller: UIViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    func addItemViewController(_ controller: UIViewController, edditItem: CheckListItem) {
        
        if let postion = checklist.index(of: edditItem) {
            let indexPath = IndexPath(row: postion, section: 0)
            
           let cell =  tableView.cellForRow(at: indexPath)!
            configureText(for: cell, with: edditItem)
        
        }
        navigationController?.popViewController(animated: true)
    }
    
    func addItemViewController(_ controller: UIViewController, item: CheckListItem) {
        
        navigationController?.popViewController(animated: true)
        
        let position = checklist.count
        checklist.append(item)
        
        let indexRow = IndexPath(item: position, section: 0)
        let indexPaths = [indexRow]
        tableView.insertRows(at: indexPaths, with: .automatic)
        
        print("addItemViewController Called")
    }
    

    var checklist: [CheckListItem]
    
    var titles = [ "Medicine", "Baby Shampoo", "Meeting with friends", "Go to Shop"]
    
    @IBAction func addItem(_ sender: Any) {
        
        let position = checklist.count
        let item = CheckListItem()
        
        let text_ = titles[Int(getRandomNumber())]
        item.text = text_
        item.isChecked = true
        checklist.append(item)

        // we have only one section
        var indexPath = IndexPath(row: position, section: 0)
        var indexpaths = [indexPath]
        tableView.insertRows(at: indexpaths, with: .automatic)
        
    }
    
    func getRandomNumber() -> UInt32 {
        var value =  arc4random_uniform(UInt32(titles.count))
        return value
    }
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
        itemThree.text = "Hello Mew..."
        itemThree.isChecked = false
        checklist.append(itemThree)
        
        
        let itemFour = CheckListItem()
        itemFour.text = "Hello Mew..."
        itemFour.isChecked = false
        checklist.append(itemFour)
        
        super.init(coder: aDecoder)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        checklist.remove(at: indexPath.row)
        tableView.reloadData()
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return checklist.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       if let cell = tableView.cellForRow(at: indexPath){
        
        let item = checklist[indexPath.row]
        item.toogle()
    
        configureCheckMark(for: cell, with: item)
        
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        
    
        let item = checklist[indexPath.row]
        
        configureText(for: cell, with: item)
        configureCheckMark(for: cell, with : item)
        
        return cell
        
    }
    
    
    func configureText(for cell: UITableViewCell, with item: CheckListItem){

        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
        
    }

    func configureCheckMark(for cell: UITableViewCell, with item: CheckListItem) {
        
        let label = cell.viewWithTag(1001) as! UILabel
        
        if item.isChecked{
            //cell.accessoryType = .checkmark
            label.text   = "√"
        }else{
            // cell.accessoryType = .none
            label.text   = ""
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AddItem" {
            let controller = segue.destination as! AddItemViewController
            
            controller.delegateAddItem = self
        } else if segue.identifier == "EditItem" {
            
            let controller = segue.destination as! AddItemViewController
            
            controller.delegateAddItem = self
            
            if let index = tableView.indexPath(for: sender as! UITableViewCell){
                
                controller.editCheckListItem = checklist[index.row]
            }
            
        }
        
    }

}

