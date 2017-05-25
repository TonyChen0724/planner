//
//  MeetingsViewController.swift
//  PlannerUI
//
//  Created by Molly Patterson on 22/05/17.
//  Copyright © 2017 Molly Patterson. All rights reserved.
//

import UIKit

var meetings = ["cosc345","cosc343","info351"]
var meetingTimes = ["1","1","1"]
var meetingLoc = ["burns","labA","LabB"]


class MeetingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    

    @IBOutlet weak var meetingsList: UITableView!
  
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return(meetings.count)
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MeetingsTableViewCell
        cell.meetingLabel.text = meetings[indexPath.row]
        cell.dateAndTime.text = meetingTimes[indexPath.row]
        cell.location.text = meetingLoc[indexPath.row]
        
        return (cell)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        meetingsList.reloadData()

        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        meetingsList.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    @IBAction func addMeetingsPopUp(_ sender: Any) {
        let popOverVC = UIStoryboard(name: "Main", bundle:
            nil).instantiateViewController(withIdentifier:"meetingsPopUpID") as! MeetingPopUpViewController
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
        
    }
    
 
 
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
