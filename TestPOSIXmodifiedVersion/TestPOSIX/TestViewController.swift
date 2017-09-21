//
//  TestViewController.swift
//  TestPOSIX
//
//  Created by Xinru Chen on 9/18/17.
//  Copyright © 2017 Xinru Chen. All rights reserved.
//
import UIKit

var CalendarArray : NSMutableArray = [];

class TestViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var calendarTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (CalendarArray.count)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = (CalendarArray[indexPath.row] as! CalendarObjc).classes
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            let target: CalendarObjc = CalendarArray[indexPath.row] as! CalendarObjc;
            CalendarArray.remove(at: indexPath.row)
            CalendarArray = NSMutableArray(array: Bridging.queryForAllCalendar());
            Bridging.deleteCalendar(byId: target.pkid);
        }
        calendarTable.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        CalendarArray = NSMutableArray(array: Bridging.queryForAllCalendar());
        calendarTable.reloadData()
    }


}
