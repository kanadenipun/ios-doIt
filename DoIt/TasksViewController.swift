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
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getTasks()
        tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        let task = tasks[indexPath.row];
        if(task.important){
            cell.textLabel?.text = "❗️\(task.name!)"
        } else {
            cell.textLabel?.text = task.name!
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "viewTaskSegue", sender: task)
    }
    
        @IBAction func addButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender:nil)
    }
    
    func getTasks(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do{
            tasks = try context.fetch(Task.fetchRequest()) as! [Task]
            print(tasks)
        }catch{
            print("OOPS AN ERROR HAS OCCURED")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "viewTaskSegue" {
            let nextVC = segue.destination as! ViewTaskViewController
            nextVC.task = sender as! Task
            nextVC.previousVC = self
        }
        
    }

}

