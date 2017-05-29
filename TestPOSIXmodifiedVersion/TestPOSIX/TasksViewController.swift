//
//  TasksViewController.swift
//  PlannerUI
//
//  Created by Molly Patterson on 22/05/17.
//  Copyright © 2017 Molly Patterson. All rights reserved.
//

import UIKit


class TasksViewController: UIViewController, UITableViewDataSource {
    
    var tasks: [String] = []
    
    @IBOutlet weak var listTableView: UITableView!
    @IBAction func addTask(_ sender: Any) {
        alert()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "taskItem")
        cell.textLabel?.text = tasks[indexPath.row]
        
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (tasks.count)
    }
    
    
    func alert() {
        let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
        alert.addTextField { (textfield) in
            textfield.placeholder = "Add Your Task..."
            textfield.keyboardType = UIKeyboardType.default
        }
        
        let add = UIAlertAction(title: "Add", style: .default) {
            (action) in
            let textfield = alert.textFields![0]
            self.tasks.append(textfield.text!)
            self.listTableView.reloadData()
            
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) {
            (alert) in
            print("Hi")
            
        }
        alert.addAction(add)
        alert.addAction(cancel)
        
        present(alert,animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listTableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = "Tasks"
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete
        {
            tasks.remove(at: indexPath.row)
            listTableView.reloadData()
        }

    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
