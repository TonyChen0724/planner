//
//  TimeTableViewController.swift
//  PlannerUI
//
//  Created by Molly Patterson on 22/05/17.
//  Copyright © 2017 Molly Patterson. All rights reserved.
//

import UIKit

var schedule = ["TestCell","","class"]

      var items = ["", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""]

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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as!MyCollectionViewCell
            
            // Use the outlet in our custom class to get a reference to the UILabel in the cell
          //  cell.myLabel.text = schedule[indexPath.row]
        cell.myLabel.text = items[indexPath.item]
           
            //cell.myLabel.text = self.items[indexPath.item]
            //colour the cells with events
        if (cell.myLabel.text != ""){
            cell.backgroundColor = UIColor.cyan // make cell more visible in our example project
        }
        else {
            cell.backgroundColor = UIColor.white
        }
        cell.myLabel.font = UIFont(name: cell.myLabel.font.fontName, size: 7)
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 0.5
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        if (items[indexPath.item] != "") {
            let alert = UIAlertController(title: "", message: "Do you want to delete this?", preferredStyle: .alert)
            let delete = UIAlertAction(title: "Delete", style: .default) {
                (action) in
                items[indexPath.row] = ""
                self.timeTableCollection.reloadData()
            }
            let cancel = UIAlertAction(title: "Cancel", style: .cancel) {
            (alert) in
            }
            alert.addAction(delete)
            alert.addAction(cancel)
            present(alert,animated: true, completion: nil)
        }
        
    }
    
    
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
        UITextField.appearance().tintColor = .black
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTableData), name: .reload, object: nil)
    }
    
    
    func reloadTableData (_notification: Notification) {
        timeTableCollection.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        timeTableCollection.reloadData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


