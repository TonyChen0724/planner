//
//  MeetingsTableViewCell.swift
//  PlannerUI
//
//  Created by Molly Patterson on 25/05/17.
//  Copyright © 2017 Molly Patterson. All rights reserved.
//

import UIKit

class MeetingsTableViewCell: UITableViewCell {

    @IBAction func reminderSwitch(_ sender: Any) {
    }
    
    @IBOutlet weak var meetingLabel: UILabel!
    
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var dateAndTime: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
