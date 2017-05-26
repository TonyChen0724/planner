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
//        cell.deadLineName.text = deadlines[indexPath.row]
//        cell.deadLineDate.text = deadlineTimes[indexPath.row]
        cell.deadLineName.text = assignmentArr[indexPath.row] as? String  // Cannot assign value of type 'Any' to type 'String?'
        cell.deadLineDate.text = assignmentArr[indexPath.row] as? String
        
        return (cell)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == UITableViewCellEditingStyle.delete
        {
            assignmentArr.remove(at: indexPath.row)
            deadLineList.reloadData()
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        assignmentArr = NSMutableArray(array:Bridging.queryForAllAssignments());
        deadLineList.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
