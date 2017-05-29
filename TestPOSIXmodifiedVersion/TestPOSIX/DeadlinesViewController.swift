//
//  DeadlinesViewController.swift
//  PlannerUI
//
//  Created by Molly Patterson on 22/05/17.
//  Copyright © 2017 Molly Patterson. All rights reserved.
//

import UIKit

//var deadlines = ["COSC343", "COSC345", "COSC243"]
//var deadlineTimes = ["13/01/17, 12:00", "13/01/17, 12:00", "13/01/17, 12:00"]
var assignmentArr : NSMutableArray = [];

class DeadlinesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var deadLineList: UITableView!
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (assignmentArr.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "deadline", for: indexPath) as! DeadlinesTableCell

        cell.deadLineName.text = (assignmentArr[indexPath.row] as! AssignmentObjc).lecture;
        cell.deadLineDate.text = (assignmentArr[indexPath.row] as! AssignmentObjc).time;
        
        return (cell)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            let target: AssignmentObjc = assignmentArr[indexPath.row] as! AssignmentObjc;
            assignmentArr.remove(at: indexPath.row)
            assignmentArr = NSMutableArray(array:Bridging.queryForAllAssignments());
            Bridging.deleteAssignment(byId: target.pkid);
        }
        deadLineList.reloadData() // FIXME
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true;
    }
    
    override func viewDidAppear(_ animated: Bool) {
        assignmentArr = NSMutableArray(array:Bridging.queryForAllAssignments());
        deadLineList.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UITextField.appearance().tintColor = .black 

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
