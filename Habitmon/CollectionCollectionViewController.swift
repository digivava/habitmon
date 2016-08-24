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

class CollectionCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
  
  let realm = try! Realm()
  var habitmons: Results<Collection>!
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  @IBOutlet weak var ribbonsCount: UILabel!
  
  // definitely refactor this later
  
//  var headers = ["Golden Habitmon collected: \(try! Realm().objects(Collection).filter("name BEGINSWITH 'Golden'").count)/\(try! Realm().objects(Habit).count)", "Habitmon collected: \(try! Realm().objects(Collection).count)/\(try! Realm().objects(Habit).count * 3)"]
  
//  var headers: [String] {
//    didSet {
//      headers = ["Golden Habitmon collected: \(try! Realm().objects(Collection).filter("name BEGINSWITH 'Golden'").count)/\(try! Realm().objects(Habit).count)", "Habitmon collected: \(try! Realm().objects(Collection).count)/\(try! Realm().objects(Habit).count * 3)"]
//    }
//  }

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
    
        habitmons = realm.objects(Collection)
    
        // the ribbons count of the current user
        ribbonsCount.text = "Ribbons: \(realm.objects(User)[0].ribbons)"
    }
  
  override func viewWillAppear(animated: Bool) {
    //so that the data will refresh when the page is visited again
    ribbonsCount.text = "Ribbons: \(realm.objects(User)[0].ribbons)"
    self.collectionView!.reloadData()
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
  
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return habitmons.count
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
      
        let habitmon = habitmons[indexPath.item]
      
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CollectionCollectionViewCell
    
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.name.text = habitmon.name
        cell.habitmonImage.image = UIImage(named: habitmon.image)
        cell.backgroundColor = UIColor.lightGrayColor() // make cell more visible in our example project
      
        return cell
    }
  
      func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
      }
  
      //provides section header
      func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView
      {
        
        let header = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: "SectionHeader", forIndexPath: indexPath) as! SectionHeaderCollectionReusableView
        
        // multiplied by 3 to account for 3 habitmon per habit
//        header.headerLabel.text = headers[1]
          header.headerLabel.text = "Habitmon collected: \(realm.objects(Collection).count)/\(realm.objects(Habit).count * 3)"
        
        return header
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
