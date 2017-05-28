//
//  MeetingPopUpViewController.swift
//  PlannerUI
//
//  Created by Molly Patterson on 23/05/17.
//  Copyright © 2017 Molly Patterson. All rights reserved.
//

import UIKit

class MeetingPopUpViewController: UIViewController {
    

    @IBOutlet weak var group: UILabel!
  
    @IBOutlet weak var timeAndDate: UITextField!
    
    @IBOutlet weak var groupText: UITextField!
    
    @IBOutlet weak var locationText: UITextField!
    
    @IBOutlet weak var locationLabel: UILabel!
    
    let datePicker = UIDatePicker()
    
    @IBAction func submit(_ sender: Any) {
        if (groupText.text != "" && timeAndDate.text != "" && locationText.text != "")
        {
            meetings.append(groupText.text!)
            //groupText.text = ""
            print(groupText.text!)
            meetingTimes.append(timeAndDate.text!)
            //timeAndDate.text = ""
            print (timeAndDate.text!)
            meetingLoc.append(locationText.text!)
            //locationText.text = ""
            print(locationText.text!)
        }
    
        self.view.removeFromSuperview()
        self.removeAnimate()
        NotificationCenter.default.post(name: .reload, object: nil)
        
//        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
//        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "nextView") as! MeetingsViewController
//        self.present(nextViewController, animated:true, completion:nil)
        
    
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
        
        timeAndDate.inputAccessoryView = toolbar
        
        //assigning date picker to text field
        timeAndDate.inputView = datePicker
    }
    func donePressed() {
        //format date
        let dateFormatter = DateFormatter()
       // dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        
        timeAndDate.text = dateFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    @IBAction func close(_ sender: Any) {
        self.view.removeFromSuperview()
        self.removeAnimate()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
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

}
extension Notification.Name {
    static let reload = Notification.Name("reload")
}
