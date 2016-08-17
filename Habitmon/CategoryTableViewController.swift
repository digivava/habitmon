//
//  CategoryTableViewController.swift
//  Habitmon
//
//  Created by VAL on 2016/08/15.
//  Copyright © 2016年 VAL. All rights reserved.
//

import UIKit
import RealmSwift

class CategoryTableViewController: UITableViewController {

  // MARK: - Properties
  
  let realm = try! Realm()
  var habits: Results<Habit>!
  
  let categories = ["Diet", "Fitness", "Creative", "Study", "Other"]
  
  func loadHabits() {
    habits = try! Realm().objects(Habit).filter("active = false")
  }
  
  func habitsInCategory(category: String) -> Results<Habit> {
    return habits.filter("category = %@", category)
  }
  
  func habitAtIndexPath(indexPath: NSIndexPath) -> Habit {
    let matchingHabits = habitsInCategory(categories[indexPath.section])
    let habit = matchingHabits[indexPath.row]
    
    return habit
  }
  
  
  // MARK: - Actions
  
  @IBAction func cancel(sender: UIBarButtonItem) {
    dismissViewControllerAnimated(true, completion: nil)
  }
  
  
  
  // MARK: - Inherited Functions
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if realm.objects(Habit.self).count == 0 {
      try! realm.write {
        realm.create(Habit.self, value: ["id": 1, "name": "No sweets", "category": "Diet", "evolution1": "Lollipup", "evolution2": "Sugpug", "evolution3": "Molassie", "evolution4": "Golden Molassie", "profile1": "Happily feasts on all the sugar you aren't eating. Particularly enjoys smugly eating your favorites right next to you. But such a loyal and cuddly friend, you can't help but stay near it.", "profile2": "Hordes a stash of gooey, fresh-baked chocolate chip cookies in its doghouse and gets vicious if you try to snag any. Likes belly-rubs.", "profile3": "A powerful yet flighty spirit that rarely shows itself to humans. Legend says it comes only to those who prove themselves as truly self-disciplined.", "profile4": "Even more rare and ethereal than Molassie. Shimmers triumphantly, and is known to inspire angelic choruses of songs about golden tickets."])
        
        realm.create(Habit.self, value: ["id": 2, "name": "Write 1000 words", "category": "Creative", "evolution1": "Wordvark", "evolution2": "Pengolin", "evolution3": "Bookupine", "evolution4": "Golden Bookupine", "profile1": "Patches of its skin open up to reveal inspiring passages from great works of literature, tragically relevant poetry, and occasionally trashy clickbait articles from the Internet.", "profile2": "Its ink-tipped tongue can produce manuscripts at 200 WPM. Does its best thinking in the early morning.", "profile3": "Its awkward introversion leads to it often being misunderstood. Uses its fountain-pen quills to work on many projects at once. Likes to be given coffee in its water bowl.", "profile4": "Just one of its golden quills is worth thousands. Helps with writer's block by threatening to roll around on you if you don't keep writing."])
        
      }

    }
    
    loadHabits()
  }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return categories.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
      //given a section index, I can figure out what category that is, and then only return the habits in that category
      
      let category = categories[section]
      let matchingHabits = habitsInCategory(category)
      
      return matchingHabits.count
    }
  
  
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
      return categories[section]
    }
  

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      // Table view cells are reused and should be dequeued using a cell identifier.
      let cellIdentifier = "CategoryTableViewCell"
      
      // Fetches the appropriate habit for the data source layout.
      let habit = habitAtIndexPath(indexPath)
      
      let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! CategoryTableViewCell
      
      cell.habitNameLabel.text = habit.name
      
      return cell

    }
  
  // when user chooses a habit from the list
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    let habit = habitAtIndexPath(indexPath)
    
    // add habit to "your habits" list
    try! realm.write {
      habit.active = true
    }
    
    // go back to "your habits" list
    dismissViewControllerAnimated(true, completion: nil)
    
  }

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
