//
//  TimeTableViewController.swift
//  PlannerUI
//
//  Created by Molly Patterson on 22/05/17.
//  Copyright © 2017 Molly Patterson. All rights reserved.
//

import UIKit

var schedule = ["TestCell","","class"]

class TimeTableViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
   
    @IBOutlet weak var timeTableCollection: UICollectionView!
        
        let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
        var items = ["", "", "", "", "", "", "", "COSC343\nBurns7", "INFO351\n530C1", "COSC343\nBurns7", "", "COSC345\nSDAV2", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "INFO351\nRAG11", "", "", "", "", "", "", "", "", "", "", "", "", "COSC343\nOWG06", "", "", "", "", "", "", "", "", "", "", "", "", "COSC345", "", "", "", "", "", "" ,"", "", ""]
    
    //add class popup

    @IBAction func addClass(_ sender: Any) {
        let popOverVC = UIStoryboard(name: "Main", bundle:
            nil).instantiateViewController(withIdentifier:"timeTablePopUpID") as! TimeTablePopUpViewController
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
    }
    
        // MARK: - UICollectionViewDataSource protocol
        // tell the collection view how many cells to make
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            //return self.items.count
            return(schedule.count)
        }
        
        // make a cell for each cell index path
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            // get a reference to our storyboard cell
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! MyCollectionViewCell
            
            // Use the outlet in our custom class to get a reference to the UILabel in the cell
            cell.myLabel.text = schedule[indexPath.row]
           
            //cell.myLabel.text = self.items[indexPath.item]
            //colour the cells with events
            if (cell.myLabel.text != ""){
                cell.backgroundColor = UIColor.cyan // make cell more visible in our example project

            }
            cell.myLabel.font = UIFont(name: cell.myLabel.font.fontName, size: 7)
            cell.layer.borderColor = UIColor.black.cgColor
            cell.layer.borderWidth = 0.5
            
            return cell
        }
        
        // MARK: - UICollectionViewDelegate protocol
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            // handle tap events
            print("You selected cell #\(indexPath.item)!")
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeTableCollection.reloadData()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        timeTableCollection.reloadData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
