//
//  CollectionCollectionViewController.swift
//  Habitmon
//
//  Created by VAL on 2016/08/22.
//  Copyright © 2016年 VAL. All rights reserved.
//

import UIKit
import RealmSwift

private let reuseIdentifier = "Cell"

class CollectionCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
  
  var habitmons: Results<Collection>!

  // for tab bar.. this isn't working yet though
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    // Initialize Tab Bar Item
    tabBarItem = UITabBarItem(title: "Collection", image: UIImage(named: "CollectionIcon"), tag: 2)
  }
  
  
  override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Do any additional setup after loading the view.
    
        habitmons = try! Realm().objects(Collection)
        print(habitmons)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  
    // MARK: - Navigation

     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     
       if segue.identifier == "Show" {
       
       let detailsVC = segue.destinationViewController as! CollectionViewController
       let cell = sender as! CollectionCollectionViewCell
       let indexPaths = self.collectionView!.indexPathForCell(cell)
       let thisHabitmon = self.habitmons[indexPaths!.row] as Collection
       detailsVC.habitmon = thisHabitmon
       
       }
     
     }

    // MARK: UICollectionViewDataSource
  
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return habitmons.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
      
        let habitmon = habitmons[indexPath.item]
      
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CollectionCollectionViewCell
    
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.name.text = habitmon.name
        cell.habitmonImage.image = UIImage(named: habitmon.image)
        cell.backgroundColor = UIColor.lightGrayColor() // make cell more visible in our example project
      
        return cell
    }
  
      override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
      }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */
  
  

}
