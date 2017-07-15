//
//  ViewController.swift
//  DoIt
//
//  Created by NIPUN KANADE on 11/07/17.
//  Copyright © 2017 ThoughtWorks. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet var tableView: UITableView!

    var tasks : [Task] = []
    var selectedTaskIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tasks = makeTasks()
 
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        let task = tasks[indexPath.row];
        if(task.important){
            cell.textLabel?.text = "❗️\(task.name)"
        } else {
            cell.textLabel?.text = task.name
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        selectedTaskIndex = indexPath.row
        performSegue(withIdentifier: "viewTaskSegue", sender: task)
    }
    
    func makeTasks() -> [Task]{
        let task1 = Task()
        task1.name = "Walk the dog"
        task1.important = false

        let task2 = Task()
        task2.name = "Buy Cheese"
        task2.important = true

        let task3 = Task()
        task3.name = "Mow the new Lawn"
        task3.important = false

        return [task1, task2, task3]

    }

    @IBAction func addButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender:nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "addSegue" {
            let nextVC = segue.destination as! CreateTaskViewController
            nextVC.previousVC = self
        }
        if segue.identifier == "viewTaskSegue" {
            let nextVC = segue.destination as! ViewTaskViewController
            nextVC.task = sender as! Task
            nextVC.previousVC = self
        }
        
    }

}

