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
    
    habits = realm.objects(Habit.self)
    
    
    
    ///// TEMPORARY for seed data
//    try! realm.write {
//      realm.deleteAll()
//    }
    
    
    
    if realm.objects(Habit).count == 0 {
      try! realm.write {
        realm.create(Habit.self, value: ["id": 1, "name": "No sweets", "habitmon": "Egg", "level": 2, "image": "Egg", "evolution1": "Lollipup", "evolution2": "Sugpug", "evolution3": "Molassie", "active": true])
        
//        realm.create(Habit.self, value: ["id": 2, "name": "Floss", "habitmon1": "Plaqodile", "image1": "monkey"])
//        realm.create(Habit.self, value: ["id": 3, "name": "Exercise for 15 min", "habitmon": "Musscle"])
      }
    }
    /////
    
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


