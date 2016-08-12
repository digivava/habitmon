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
    print(habits)
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    habits = realm.objects(Habit.self)
    
    ///// TEMPORARY for seed data
    try! realm.write {
      realm.deleteAll()
    }
    
    if realm.objects(Habit).count == 0 {
      try! realm.write {
        realm.create(Habit.self, value: ["id": 1, "name": "No sweets", "habitmon": "Lollipup", "image": "lollipup", "active": true])
        realm.create(Habit.self, value: ["id": 2, "name": "Floss", "habitmon": "Plaqodile", "image": "monkey"])
//        realm.create(Habit.self, value: ["id": 3, "name": "Exercise for 15 min", "habitmon": "Musscle"])
      }
    }
    /////
    
    loadHabits()
    print("blahblahblah")
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
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
    
    print("test")
    print(habit.image)
    
    cell.habitNameLabel.text = habit.name
    cell.habitmonImage.image = UIImage(named: habit.image!)
    cell.levelNumberLabel.text = String(habit.level)
    
    return cell
  }
  
  // MARK: - Habit List Actions
  
  //  func populateHabitsList(realm: Realm) {
  //    var userHabits = realm.objects(Habit.self).filter("status = 'active'")
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
  
}


