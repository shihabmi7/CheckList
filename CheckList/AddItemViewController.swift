//
//  AddItemViewController.swift
//  CheckList
//
//  Created by Mahmud Riad on 9/5/18.
//  Copyright © 2018 Shihab. All rights reserved.
//

import UIKit

class AddItemViewController: UITableViewController {

   @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.largeTitleDisplayMode = .never
    }
    

    override func viewWillAppear(_ animated: Bool) {
        textField.becomeFirstResponder()
    }
    
    @IBAction func cancel(){
        
        navigationController?.popViewController(animated: true)

    }
    
    @IBAction func Done(){
        
 navigationController?.popViewController(animated: true)
        
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        
        return nil
    }

}
