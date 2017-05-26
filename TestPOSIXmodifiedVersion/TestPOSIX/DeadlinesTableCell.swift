//
//  DeadlinesTableCell.swift
//  PlannerUI
//
//  Created by Luke on 24/05/17.
//  Copyright © 2017 Molly Patterson. All rights reserved.
//

import UIKit

class DeadlinesTableCell: UITableViewCell {
    
    
    @IBOutlet weak var deadLineName: UILabel!
    @IBOutlet weak var deadLineDate: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
