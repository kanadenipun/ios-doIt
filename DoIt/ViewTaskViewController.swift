//
//  ViewTaskViewController.swift
//  DoIt
//
//  Created by NIPUN KANADE on 15/07/17.
//  Copyright © 2017 ThoughtWorks. All rights reserved.
//

import UIKit

class ViewTaskViewController: UIViewController {

    var task = Task()
    var previousVC = TasksViewController()
    var selectedTaskIndex = 0
    
    @IBOutlet weak var taskLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        if(task.important){
            taskLabel.text = "❗️\(task.name)"
        } else {
            taskLabel.text = task.name
        }
    }
    

    @IBAction func completeTaskTapped(_ sender: Any) {
        previousVC.tasks.remove(at: selectedTaskIndex)
        previousVC.tableView.reloadData()
        navigationController?.popViewController(animated: true)
    }
    
    
}
