//
//  AddDeadLineController.swift
//  PlannerUI
//
//  Created by Luke on 23/05/17.
//  Copyright © 2017 Molly Patterson. All rights reserved.
//

import UIKit

class AddDeadLineController: UIViewController {

    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var deadlineTime: UITextField!
    let datePicker = UIDatePicker()
    
    @IBAction func addDeadLine(_ sender: Any)
    {
        if (input.text != "" && deadlineTime.text != "")
        {
            let ass: AssignmentObjc = AssignmentObjc.init(pkid: -1, lecture: input.text!, time: deadlineTime.text!, position: "");
            var timer = deadlineTime.text!;
            var timerArr = timer.components(separatedBy: "/")
            var day = timerArr[1]
            var substitution = Int(day)! - 21;
            var remainder = substitution % 7
            var restInfo = timerArr[2]
            var restArr = restInfo.components(separatedBy: ", ")
            var specificTime = restArr[1]
            var stimeArr = specificTime.components(separatedBy: ":")
            var clock = Int(stimeArr[0])!
            var stimeArrArr = stimeArr[1].components(separatedBy: " ")
            var afterevening = stimeArrArr[1]
            
            var month = timerArr[0]
            var year = restArr[0]
            
            var total = "20" + year + "-" + month + "-" + day;
            var week = getDayOfWeek(today: total)
            
            
            
            print(afterevening)
            if (afterevening == "PM") {
                clock = clock + 12
            }
            if (remainder == 0 || remainder == 6) {
                
            } else {
                print((remainder-1) * 5 + (clock-8))
                items.insert(input.text!, at: (week-1) * 5 + (clock-8));
            }
                
            // items.insert(input.text!, at: deadlineTime.text!(days) * 5 + (oclock - 8))
            input.text = ""
            deadlineTime.text = ""
            Bridging.insertNewAssignmentObjc(ass);
        }
    }
    
    func getDayOfWeek(today:String)->Int {
        
        let formatter  = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let todayDate = formatter.date(from: today)!
        let myCalendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!
        let myComponents = myCalendar.components(.weekday, from: todayDate)
        let weekDay = myComponents.weekday
        return weekDay!
    }
    
    
    
    func createDatePicker()
    {
        //format picker
        datePicker.datePickerMode = .dateAndTime
        //toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //bar button item
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated:false)
        
        deadlineTime.inputAccessoryView = toolbar
        
        //assigning date picker to text field
        deadlineTime.inputView = datePicker
    }
    func donePressed() {
        //format date
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        
        deadlineTime.text = dateFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createDatePicker()
        self.navigationController?.navigationBar.tintColor = UIColor.blue;

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
