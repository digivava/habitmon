//
//  HabitTableViewController.swift
//  Habitmon
//
//  Created by VAL on 2016/08/11.
//  Copyright © 2016年 VAL. All rights reserved.
//

import UIKit
import RealmSwift

class HabitTableViewController: UITableViewController {
  
  let realm = try! Realm()
  var habits: Results<Habit>!
  
  func loadHabits() {
    habits = try! Realm().objects(Habit).filter("active = true")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    ///// TEMPORARY for seed data
    try! realm.write {
      realm.deleteAll()
    }
    
    loadHabits()
  }
  
  override func viewWillAppear(animated: Bool) {
    //so that the table data will refresh when the page is visited again
    self.tableView.reloadData()
  }
  
  // MARK: Necessary Delegate Methods
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return habits.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    // Table view cells are reused and should be dequeued using a cell identifier.
    let cellIdentifier = "HabitTableViewCell"
    
    // Fetches the appropriate habit for the data source layout.
    let habit = habits[indexPath.row]
    
    let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! HabitTableViewCell
    
    cell.habitNameLabel.text = habit.name
    cell.habitmonImage.image = UIImage(named: habit.image!)
    cell.levelNumberLabel.text = "\(habit.level)"
    
    return cell
  }
  
  override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    return true
  }
  
  override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if (editingStyle == UITableViewCellEditingStyle.Delete) {
      // handle delete (by removing the data from your array and updating the tableview)
      let habit = habits[indexPath.row]
      
      let deletionAlert = UIAlertController(title: "Delete Habit", message: "Are you sure you want to remove this habit? This action cannot be undone.", preferredStyle: UIAlertControllerStyle.Alert)
      
      deletionAlert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action: UIAlertAction!) in
        try! self.realm.write {
          // almost like a fake initialization... because these values need to go back to how they were before, but because of the way our whole data model is structured, we can't just reinitialize it. oops haha. could have done that better.
          habit.active = false
          habit.level = 0
          habit.evolveLevel = 5
          habit.checked = false
          habit.cheatDays = 3
          habit.habitmon = "Egg"
          habit.image = "Egg"
          habit.profile = "A mysterious egg. I wonder what's inside?"
          habit.updatedAt = NSDate()
        }
        
        self.tableView.reloadData()
      }))
      
      deletionAlert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: { (action: UIAlertAction!) in
        self.tableView.reloadData()
      }))
      
      presentViewController(deletionAlert, animated: true, completion: nil)
      
      
      
      
      
      
      
//      try! realm.write {
//        habit.active = false
//      }
//      
//      self.tableView.reloadData()
      
      print(habit.active)
    }
  }
  
  // MARK: - Habit List Actions
  
//  @IBAction func unwindToHabitList(sender: UIStoryboardSegue) {
//    if let sourceViewController = sender.sourceViewController as? HabitViewController, habit = sourceViewController.habit {
//      
//      var unwindedHabit = Habit()
//      
//      if let selectedIndexPath = tableView.indexPathForSelectedRow { // User clicked on a row
//        
//        // Updating of the habit is done in HabitViewController
//        
//        tableView.reloadRowsAtIndexPaths([selectedIndexPath], withRowAnimation: .None)
//      } else {
//        // Add a new habit.
//        let newIndexPath = NSIndexPath(forRow: Int(habits.count), inSection: 0)
//        
//        // Persist in database
//        let realm = try! Realm()
//        try! realm.write {
//          
//          unwindedHabit.name = habit.name
//          unwindedHabit.level = habit.level
//          unwindedHabit.image = habit.image
//          
////          realm.addObjects([unwindedHabit])
//        }
//        
//        tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
//      }
//    }
//  }
  
  // MARK: - Navigation
  
   override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
           //Get the new view controller using segue.destinationViewController.
           //Pass the selected object to the new view controller.
    
      if segue.identifier == "Show" {
        let habitDetailViewController = segue.destinationViewController as! HabitViewController
//      segue.destinationViewController.name = habit.name
        
        // Get the cell that generated this segue.
        if let selectedHabitCell = sender as? HabitTableViewCell {
          let indexPath = tableView.indexPathForCell(selectedHabitCell)!
          let selectedHabit = habits[indexPath.row]
          habitDetailViewController.habit = selectedHabit
        }
      }
        
      else if segue.identifier == "AddItem" {
      }
    
    
    }
  
//  @IBAction func unwindToHabitList(sender: UIStoryboardSegue) {
//    if let sourceViewController = sender.sourceViewController as? HabitViewController, habit = sourceViewController.habit {
//      //the following gets executed if an existing meal is being edited.
//      if let selectedIndexPath = tableView.indexPathForSelectedRow {
//        // Update an existing habit.
//        habits[selectedIndexPath.row] = habit
//        tableView.reloadRowsAtIndexPaths([selectedIndexPath], withRowAnimation: .None)
//      } else {
//        // Add a new habit.
//        let newIndexPath = NSIndexPath(forRow: habits.count, inSection: 0)
////        habits.append(habit)
//        tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
//      }
//      
//    }
//  
//  }
  
}


