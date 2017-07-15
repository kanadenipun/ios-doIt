//
//  CreateTaskViewController.swift
//  DoIt
//
//  Created by NIPUN KANADE on 14/07/17.
//  Copyright © 2017 ThoughtWorks. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {

    @IBOutlet weak var newTaskInput: UITextField!
    @IBOutlet weak var setImportantSwitch: UISwitch!
    
    var previousVC = TasksViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func addTapped(_ sender: Any) {
        let task = Task()
        task.name = newTaskInput.text!
        task.important = setImportantSwitch.isOn
        
        previousVC.tasks.append(task)
        previousVC.tableView.reloadData()
        
        navigationController!.popViewController(animated: true)
    }
}
