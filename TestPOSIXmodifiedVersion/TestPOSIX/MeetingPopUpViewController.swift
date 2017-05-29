/**
 Cosc345 Asn 2, MeetingPopUpViewController.swift
 Purpose: After user hits Add button this UI will show.
 
 @author Xinru Chen, Luke Falvey, Molly Patterson
 @version 1.0 5/29/17
 */

import UIKit

class MeetingPopUpViewController: UIViewController {
    

    @IBOutlet weak var group: UILabel!
  
    @IBOutlet weak var timeAndDate: UITextField!
    
    @IBOutlet weak var groupText: UITextField!
    
    @IBOutlet weak var locationText: UITextField!
    
    @IBOutlet weak var locationLabel: UILabel!
    
    let datePicker = UIDatePicker()
/*
    action after user hits the submit.
*/
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
    }
/*
    a small object which enable users to pick a date instead of inputing one.
*/
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
/*
    actions after the user pressed done
*/
    
    func donePressed() {
        //format date
        let dateFormatter = DateFormatter()
       // dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        
        timeAndDate.text = dateFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
/*
    close the MeetingPopUI.
*/
    @IBAction func close(_ sender: Any) {
        self.view.removeFromSuperview()
        self.removeAnimate()
    }
/*
    everytime the UI showed.
*/
    override func viewDidLoad() {
        super.viewDidLoad()
        UITextField.appearance().tintColor = .black 
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        self.showAnimate()
        createDatePicker()
        // Do any additional setup after loading the view.
    }
/*
    check if it received memory warning.
*/
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
/*
    show the animation.
    reference: github.com/awseeley/Swift-Pop-Up-View-Tutorial/blob/master/PopUp/PopUpViewController.swift.
*/
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
/*
    animation when remove something.
*/
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
/*
    part of methods to solve tab bar disappearing problems.
 */
extension Notification.Name {
    static let reload = Notification.Name("reload")
}
