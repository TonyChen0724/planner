//
//  TimeTablePopUpViewController.swift
//  PlannerUI
//
//  Created by Molly Patterson on 26/05/17.
//  Copyright © 2017 Molly Patterson. All rights reserved.
//

import UIKit

class TimeTablePopUpViewController: UIViewController {
    
    @IBOutlet weak var addToTimeTable: UIView!
    
    @IBOutlet weak var classLabel: UILabel!

    @IBOutlet weak var classText: UITextField!
  
    @IBOutlet weak var startTime: UITextField!
    
    @IBOutlet weak var daysLabel: UILabel!
    
    @IBOutlet weak var finishTime: UITextField!
    
    @IBOutlet weak var locationLable: UILabel!
    
    @IBOutlet weak var locationText: UITextField!
    
    var monday: BooleanLiteralType! = false
    var tuesday: BooleanLiteralType! = false
    var wednesday: BooleanLiteralType! = false
    var thursday : BooleanLiteralType! = false
    var friday : BooleanLiteralType! = false
    
    let datePicker = UIDatePicker()
    
    var column: Int!
    var row: Int!
    
    @IBAction func daycheckbox(_ sender: UIButton) {
        // Instead of specifying each button we are just using the sender (button that invoked) the method
        if (sender.isSelected == true)
        {
            print(sender.titleLabel!.text!)
            if (sender.titleLabel!.text! == "Monday"){
                monday = false
            }else if (sender.titleLabel!.text == "Tuesday"){
                tuesday = false
            } else if (sender.titleLabel!.text! == "Wednesday"){
                wednesday = false
                
            }else if (sender.titleLabel!.text! == "Thursday"){
                thursday = false
                
            }else if (sender.titleLabel!.text! == "Friday"){
                friday = false
            }
          
            sender.setBackgroundImage(UIImage(named: "uncheckedBox.png"), for: UIControlState.normal)
            sender.isSelected = false;
            //need to remove if already selected day
        }
        else
        {
            if (sender.titleLabel!.text! == "Monday"){
                print("mon")
                monday = true
            }else if (sender.titleLabel!.text == "Tuesday"){
                tuesday = true
                print("tues")
            } else if (sender.titleLabel!.text! == "Wednesday"){
                wednesday = true
                print("wednesday")
                
            }else if (sender.titleLabel!.text! == "Thursday"){
                thursday = true
                print("thurs")
                
            }else if (sender.titleLabel!.text! == "Friday"){
                friday = true
                print ("fri")
            }
            sender.setBackgroundImage(UIImage(named: "checkbox.png"), for: UIControlState.normal)
            sender.isSelected = true;
            schedule.append(" " + sender.titleLabel!.text!)
        }
    }
    
    @IBAction func close(_ sender: Any) {
        self.view.removeFromSuperview()
        self.removeAnimate()
    }
    
    @IBAction func submit(_ sender: Any) {
        
    
     
        
        
        if (classText.text != "" && locationText.text != "" && startTime.text != "")
     {
        
        if (monday == true){
            column = 0
        }else if (tuesday == true){
            column = 1
        }else if (wednesday == true){
            column = 2
        }else if (thursday == true){
            column = 3
        }else{
            column = 4
        }
        
        schedule.append(classText.text! + "\n" + locationText.text! + "\n" + startTime.text!)
        /*let index = startTime.text!.index(startTime.text!.startIndex, offsetBy: 1)
        if (startTime.text!.substring(to: index) == ":"){
            
            row = Int(startTime.text!.substring(to: index))
        }else{
            let index = startTime.text!.index(startTime.text!.startIndex, offsetBy: 2)
            row = Int(startTime.text!.substring(to: index))
        }*/
        //print(startTime.text!)
        
        
        var ttime = startTime.text
        var ttimeArr = ttime!.components(separatedBy: ":")
        var clock = ttimeArr[0]
        var row = Int(clock)! - 8
        var rest = ttimeArr[1]
        var restArr = rest.components(separatedBy: " ")
        var afterevening = restArr[1]
        
        if (afterevening == "PM" && Int(clock) != 12) {
            row = row + 12
        }
        
        //items.insert(classText.text! + "\n" + locationText.text! + "\n" + startTime.text!, at: column + row*5)
        items[column+row*5] = classText.text! + "\n" + locationText.text! + "\n" + startTime.text!
        //items.remove(at: 60)
        
        
        
        
//        print (schedule)
//        //        print(column)
//        print(row)
//        if (row>0 && row<9){
//            row = row + 4
//            items.insert(classText.text! + "\n" + locationText.text! + "\n" + startTime.text!, at: column + (row*5))
//        }
//        else{
//            row = row - 8
//            items.insert(classText.text! + "\n" + locationText.text! + "\n" + startTime.text!, at: column + (row*5))
//        }
//        }
        }
        self.view.removeFromSuperview()
        self.removeAnimate()
        NotificationCenter.default.post(name: .reload, object: nil)
    }
    
    func createDatePicker()
    {
        //format picker
        datePicker.datePickerMode = .time
        //toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //bar button item
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated:false)
        
        startTime.inputAccessoryView = toolbar
        
        //assigning date picker to text field
        startTime.inputView = datePicker
    }
    func donePressed() {
        //format date
        let dateFormatter = DateFormatter()
        
        dateFormatter.timeStyle = .short
        
        startTime.text = dateFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UITextField.appearance().tintColor = .black
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        self.showAnimate()
        createDatePicker()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //github.com/awseeley/Swift-Pop-Up-View-Tutorial/blob/master/PopUp/PopUpViewController.swift
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.view.removeFromSuperview()
            }
        });
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
