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
            deadlines.append(input.text!)
            input.text = ""
            deadlineTimes.append(deadlineTime.text!)
            deadlineTime.text = ""
        }
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

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
