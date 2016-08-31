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
  
  func seedHabits() {
    try! realm.write {
      realm.create(Habit.self, value: ["id": 1, "name": "No sweets", "category": "Diet", "evolution1": "Lollipup", "evolution2": "Sugpug", "evolution3": "Molassie", "profile1": "Happily feasts on all the sugar you aren't eating. Particularly enjoys smugly eating your favorites right next to you. But such a loyal and cuddly friend, you can't help but stay near it.", "profile2": "Hordes a stash of gooey, fresh-baked chocolate chip cookies in its doghouse and gets vicious if you try to snag any. Likes belly-rubs.", "profile3": "A powerful yet flighty spirit that rarely shows itself to humans. Legend says it comes only to those who prove themselves as truly self-disciplined."])
      
      realm.create(Habit.self, value: ["id": 2, "name": "Eat vegetarian", "category": "Diet", "evolution1": "Vealeaf", "evolution2": "Cowliflower", "evolution3": "Vegetabull", "profile1": "Rescued from the jaws of a carnivore, this Habitmon is very grateful to you, but also seems a little nervous.", "profile2": "Likes to snuggle you and moo softly when it's not out there being an activist.", "profile3": "Has a bit of a temper. Grows an infinite supply of delicious vegetables from its body, and is happy to share them with you."])
      
      realm.create(Habit.self, value: ["id": 3, "name": "Practice foreign language", "category": "Study", "evolution1": "Speakter", "evolution2": "Bilinghoul", "evolution3": "Langwitch", "profile1": "A prideful Habitmon that is especially proficient in pig Latin. Its ghostly transparency frustrates you because of how squeezable it looks.", "profile2": "Knows all sorts of obscure, spooky nursery rhymes in other languages, and whispers them to you while you sleep.", "profile3": "It cooks a variety of foods from your target language's country, but if you don't like the taste it will screech profanities that you haven't learned yet."])
      
      realm.create(Habit.self, value: ["id": 4, "name": "Work out", "category": "Fitness", "evolution1": "Musscle", "evolution2": "Barnuckle", "evolution3": "Shellflex", "profile1": "Gives great motivational speeches. You are unsure of where it hides its unlimited supply of sports drinks.", "profile2": "Expert high-five giver and beloved by all, but often feels bashful about the fishy smell of its sweat.", "profile3": "Has high expectations, as a former trainer of Olympic athletes. Affectionately calls you 'pansy'."])
      
      realm.create(Habit.self, value: ["id": 5, "name": "Floss", "category": "Other", "evolution1": "Plaqodile", "evolution2": "Flossiraptor", "evolution3": "Pterodentyl", "profile1": "An expert at squeezing into tight spaces. Has complicated feelings toward mint ice cream.", "profile2": "A feisty Habitmon that is always trying to wedge itself into your mouth.", "profile3": "Very high-maintenance as it needs constant cleaning. But extremely loyal, and has powerful teeth-whitening properties."])
      
      realm.create(Habit.self, value: ["id": 6, "name": "Play musical instrument", "category": "Creative", "evolution1": "Songkong", "evolution2": "Orangutwang", "evolution3": "Chimphony", "profile1": "It can produce all sorts of music on its little triangle, including death metal and Mongolian throat-singing.", "profile2": "Loves to share music and invites you to a different concert every weekend. Prefers vinyl.", "profile3": "A world-renowned monkey composer. Always in a pretentious Internet flame war with his arch-nemesis A-Capellican over musical tastes."])
      
      realm.create(Habit.self, value: ["id": 7, "name": "Avoid carbs", "category": "Diet", "evolution1": "Butterhorn", "evolution2": "Buffaloaf", "evolution3": "Wildayeest", "profile1": "Jealously stampedes all over any grain product it notices you contemplating. Makes cute noises.", "profile2": "Smells delicious when warm. But if you try to nibble on it, it tastes like poison.", "profile3": "Fierce and strong, yet lean. Lets you ride it into the sunset sometimes."])
      
      realm.create(Habit.self, value: ["id": 8, "name": "Write 1000 words", "category": "Creative", "evolution1": "Wordvark", "evolution2": "Pengolin", "evolution3": "Bookupine", "profile1": "Patches of its skin open up to reveal inspiring passages from great works of literature, tragically relevant poetry, and occasionally trashy clickbait articles from the Internet.", "profile2": "Its ink-tipped tongue can produce manuscripts at 200 WPM. Does its best thinking in the early morning.", "profile3": "Its awkward introversion leads to it often being misunderstood. Uses its fountain-pen quills to work on many projects at once. Likes to be given coffee in its water bowl."])
      
      realm.create(Habit.self, value: ["id": 9, "name": "8 cups of water", "category": "Diet", "evolution1": "Splashrew", "evolution2": "Aquassum", "evolution3": "Bubblebat", "profile1": "Squeaks when your water bottle is getting low. Likes to be scratched behind its ears.", "profile2": "If you're not getting enough water, this Habitmon tries to help by rubbing its wet body all over your nice warm clothes.", "profile3": "Always slurping up seltzer water through its long tongue. At least its burps are cute."])
      
      realm.create(Habit.self, value: ["id": 10, "name": "Go jogging", "category": "Fitness", "evolution1": "Joghog", "evolution2": "Hamstring", "evolution3": "Marathoink", "profile1": "Tries its best to keep up but runs out of breath easily. Skilled at tripping.", "profile2": "Wakes up at the crack of dawn for a run, followed by a mud bath. Loves protein shakes.", "profile3": "Hums motivational workout music in its sleep. Ties its shoelaces with vicious fervor. 100% muscle, somehow."])
    }
  }

  
  // MARK: - Actions
  
  @IBAction func cancel(sender: UIBarButtonItem) {
    dismissViewControllerAnimated(true, completion: nil)
  }
  
  
  
  // MARK: - Inherited Functions
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if realm.objects(Habit.self).count == 0 {
      seedHabits()
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
