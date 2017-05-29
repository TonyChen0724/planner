/**
 Cosc345 Asn 2, MeetingsViewController.swift
 Purpose: the Meeting UI.
 
 @author Xinru Chen, Luke Falvey, Molly Patterson
 @version 1.0 5/29/17
 */

import UIKit

var meetings: [String] = []
var meetingTimes: [String] = []
var meetingLoc: [String] = []


class MeetingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    

    @IBOutlet weak var meetingsList: UITableView!
  
    /*
     get the number of items inside meetings array.
     */
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
    
    /*
     everytime the MeetingViewController shows.
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        meetingsList.reloadData()
        UITextField.appearance().tintColor = .black 
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTableData), name: .reload, object: nil)

    }
    /* part of code to solve tab view disappearing problem. */
 
    func reloadTableData(_ notification: Notification) {
        meetingsList.reloadData()
    }
    
    /* delete function */
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            // remove the item from the data model
            meetings.remove(at: indexPath.row)
            meetingTimes.remove(at: indexPath.row)
            meetingLoc.remove(at: indexPath.row)
            
            // delete the table view row
            tableView.deleteRows(at: [indexPath], with: .fade)

            
        }
        meetingsList.reloadData() // FIXME
    }
    /* reload data of meetingList */
    override func viewDidAppear(_ animated: Bool) {
        meetingsList.reloadData()
        
    }
    /* check if it received memory warning */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   /* when user hits add button it goes to addMeetingsPopUp */
    @IBAction func addMeetingsPopUp(_ sender: Any) {
        let popOverVC = UIStoryboard(name: "MainSwift", bundle:
            nil).instantiateViewController(withIdentifier:"meetingsPopUpID") as! MeetingPopUpViewController
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
        
    }
}
