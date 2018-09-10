//
//  AddItemViewController.swift
//  CheckList
//
//  Created by Mahmud Riad on 9/5/18.
//  Copyright © 2018 Shihab. All rights reserved.
//

import UIKit


protocol AddItemViewControllerProtocol : class {
    
    func addItemViewControllerDidCancel(_ controller: UIViewController)
    func addItemViewController(_ controller: UIViewController, item: CheckListItem)
    
}
class AddItemViewController: UITableViewController,UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    @IBOutlet weak var backBarButton: UIBarButtonItem!
    
    weak var delegateAddItem: AddItemViewControllerProtocol?
    
    var editCheckListItem: CheckListItem?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        
        if let item = editCheckListItem {
            title = "Edit Item"
            textField.text = item.text
            doneBarButton.isEnabled = true
        }
        
        
    }

    override func viewWillAppear(_ animated: Bool) {
        textField.becomeFirstResponder()
    }
    
    @IBAction func cancel(){
        
        navigationController?.popViewController(animated: true)
        delegateAddItem?.addItemViewControllerDidCancel(self)
    }
    
    @IBAction func Done(){
        
       // navigationController?.popViewController(animated: true)
       //  print("Content of the textfield , \(textField.text) ")
        let itemChecklist = CheckListItem()
        itemChecklist.text = textField.text!
        itemChecklist.isChecked = false
         
        delegateAddItem?.addItemViewController(self, item: itemChecklist)
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        
        return nil
    }

    // @shihab : learn another way
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//
//        textField.resignFirstResponder()
//        return false
//    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let oldText = textField.text!
        let stringRange = Range(range,in:oldText)
        let newText = oldText.replacingCharacters(in: stringRange!, with:  string)
        
        if newText.isEmpty {
            doneBarButton.isEnabled = false
        }else{
            doneBarButton.isEnabled = true
        }
        
        return true
    }
    
}
