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
    @IBAction func addDeadLine(_ sender: Any)
    {
        if (input.text != "")
        {
            deadlines.append(input.text!)
            input.text = ""
        }
        
        
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
