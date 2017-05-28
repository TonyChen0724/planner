//
//  TimeTableViewController.swift
//  PlannerUI
//
//  Created by Molly Patterson on 22/05/17.
//  Copyright © 2017 Molly Patterson. All rights reserved.
//

import UIKit

var schedule = ["TestCell","","class"]

      var items = ["", "", "", "", "", "", "", "COSC343\nBurns7", "INFO351\n530C1", "COSC343\nBurns7", "", "COSC345\nSDAV2", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "INFO351\nRAG11", "", "", "", "", "", "", "", "", "", "", "", "", "COSC343\nOWG06", "", "", "", "", "", "", "", "", "", "", "", "", "COSC345", "", ""]

class TimeTableViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
   
    
    @IBOutlet weak var timeTableCollection: UICollectionView!
    
    //fileprivate let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    fileprivate let sectionInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
    
    
        
        let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
  
    
    fileprivate let itemsPerRow: CGFloat = 6
    
    //add class popup

    @IBAction func addClass(_ sender: Any) {
        let popOverVC = UIStoryboard(name: "MainSwift", bundle:
            nil).instantiateViewController(withIdentifier:"timeTablePopUpID") as! TimeTablePopUpViewController
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
    }
    
        // MARK: - UICollectionViewDataSource protocol
        // tell the collection view how many cells to make
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return items.count
           // return(schedule.count)
        }
        
        // make a cell for each cell index path
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            // get a reference to our storyboard cell
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! MyCollectionViewCell
            
            // Use the outlet in our custom class to get a reference to the UILabel in the cell
          //  cell.myLabel.text = schedule[indexPath.row]
            cell.myLabel.text = items[indexPath.item]
           
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
    
  
    /*
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        //2
         let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
 */
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    // 4
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
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
