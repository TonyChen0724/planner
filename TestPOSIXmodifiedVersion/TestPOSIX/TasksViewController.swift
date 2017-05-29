/**
 Cosc345 Asn 2, TasksViewController.swift
 
 @author Xinru Chen, Luke Falvey, Molly Patterson
 @version 1.0 5/29/17
 */
import UIKit


class TasksViewController: UIViewController, UITableViewDataSource {
    
    var tasks: [String] = []
    
    @IBOutlet weak var listTableView: UITableView!
    @IBAction func addTask(_ sender: Any) {
        alert()
    }
    /* shows tasks in Tasks UI. */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "taskItem")
        cell.textLabel?.text = tasks[indexPath.row]
        
        return cell
    }
    /* get the number of items in tasks array */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (tasks.count)
    }
    /* the pop up window that user uses to create task records */
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
    
    /* everytime TasksViewController is called */
    override func viewDidLoad() {
        super.viewDidLoad()
        listTableView.dataSource = self
        UITextField.appearance().tintColor = .black
    }
    /* check if the view will appear or not */
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = "Tasks"
    }
    /* add delete function to tasks UI */
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete
        {
            tasks.remove(at: indexPath.row)
            listTableView.reloadData()
        }

    }

    /* check if it received memory warning */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
