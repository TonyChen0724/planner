//
//  Test2ViewController.swift
//  TestPOSIX
//
//  Created by Xinru Chen on 9/18/17.
//  Copyright © 2017 Xinru Chen. All rights reserved.
//

import UIKit

class Test2ViewController: UIViewController {
    
    @IBOutlet weak var classes: UITextField!
    @IBOutlet weak var starttime: UITextField!
    @IBOutlet weak var days: UITextField!
    @IBOutlet weak var week: UITextField!
    @IBOutlet weak var fortnight: UITextField!
    @IBOutlet weak var location: UITextField!
    
    @IBAction func addEvent(_ sender: UIButton)
    {
        let cal: CalendarObjc = CalendarObjc.init(pkid: -1, classes: classes.text!, starttime: starttime.text!, days: days.text!, weekly: week.text!, fortnightly: fortnight.text!, location: location.text!);
        Bridging.insert(cal);
        
        
    }
}
