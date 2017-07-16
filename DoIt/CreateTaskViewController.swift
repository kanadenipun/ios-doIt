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
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func addTapped(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let task = Task(context: context)
        
        task.name = newTaskInput.text!
        task.important = setImportantSwitch.isOn
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
    }
}
