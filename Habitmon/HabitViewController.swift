//
//  HabitViewController.swift
//  Habitmon
//
//  Created by VAL on 2016/08/11.
//  Copyright © 2016年 VAL. All rights reserved.
//

import UIKit
import RealmSwift

class HabitViewController: UIViewController {

  let realm = try! Realm()
  var habit: Habit!
  
  // MARK: - Properties
  @IBOutlet weak var habitmonImage: UIImageView!
  @IBOutlet weak var levelNumberLabel: UILabel!
  @IBOutlet weak var habitmonNameLabel: UILabel!
  @IBOutlet weak var habitmonDescription: UILabel!
  @IBOutlet weak var evolveLevelLabel: UILabel!
  @IBOutlet weak var checkboxButton: UIButton!
  @IBOutlet weak var cheatHearts: UIImageView!
  @IBOutlet weak var cheatDaysButton: UIButton!
  
  
  
  // property observers, for updating values in real time. need to do this with the picture soon too.
  var levelValue: Int = 0 {
    didSet {
      levelNumberLabel.text = "level \(levelValue)"
    }
  }
  
  var habitmonNameText: String = "" {
    didSet {
      habitmonNameLabel.text = "\(habitmonNameText)"
    }
  }
  
  var habitmonDescriptionText: String = "" {
    didSet {
      habitmonDescription.text = "\(habitmonDescriptionText)"
    }
  }
  
  
  var habitmonImageView: UIImage! {
    didSet {
      habitmonImage.image = habitmonImageView
    }
  }
  
  var evolveLevelText: Int = 0 {
    didSet {
      //to account for eggs hatching
      if habit.level < 5 {
        evolveLevelLabel.text = "Hatches at level \(evolveLevelText)"
      } else {
        evolveLevelLabel.text = "Evolves at level \(evolveLevelText)"
      }
    }
  }
  
  var cheatDaysHearts: UIImage! {
    didSet {
      cheatHearts.image = cheatDaysHearts
    }
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // makes this view vertically scrollable
//    let scrollView = view as! UIScrollView
//    scrollView.setContentOffset(CGPointMake(0, scrollView.contentOffset.y), animated: false)
//    [self.scrollView setContentOffset: CGPointMake(0, self.scrollView.contentOffset.y)];
    
    // get the difference between the current time and when user last checked the checkbox
    let elapsedTime = NSDate().timeIntervalSinceDate(habit.updatedAt)
    // convert to integer for easier handling
    let duration = Int(elapsedTime)

    // the amount of seconds that the user must wait before they can check the checkbox again. in production this should be something like 12 hours, i.e. 43,200 secs. but "duration" is measured in seconds so for development a small number like 12 (seconds) is fine.
    let waitingTime = 0

    // user can't interact with checkbox if already has been checked within 12 hrs
    if duration < waitingTime && habit.checked == true {
      checkboxButton.setBackgroundImage(UIImage(named: "checkedOff"), forState: UIControlState.Normal)
      checkboxButton.enabled = false
    } else {
      checkboxButton.setBackgroundImage(UIImage(named: "emptyCheckbox"), forState: UIControlState.Normal)
      checkboxButton.enabled = true
    }
    
    // connects to property observer so that it can update level number in real time
    levelValue = habit.level
    habitmonNameText = habit.habitmon!
    habitmonDescriptionText = habit.profile!
    habitmonImageView = UIImage(named: habit.image!)
    evolveLevelText = habit.evolveLevel
    cheatDaysHearts = UIImage(named: "hearts\(habit.cheatDays)")
  }
  
  func congratsPopup(level: Int) {
    
    let congratsAlert = UIAlertController(title: "Congratulations!", message: "", preferredStyle: UIAlertControllerStyle.Alert)
    
    if level == 5 {
      congratsAlert.message = "Your egg has finally hatched! Keep working hard and your Habitmon will evolve!"
    } else if level == 15 {
      congratsAlert.message = "You're doing so well with your habit that your Habitmon just evolved! Keep it up!"
    } else if level == 30 {
      congratsAlert.message = "You've done your habit for a whole month now! Your Habitmon and its previous evolutions will be added to the Collection."
    }
    
    congratsAlert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action: UIAlertAction!) in
      print("Habitmon evolved.")
    }))
    
    presentViewController(congratsAlert, animated: true, completion: nil)
  }
  
  func levelUpResults() {
    if habit.level == 5 {
      congratsPopup(habit.level)
      try! realm.write {
        habit.habitmon = habit.evolution1
        habit.image = habit.evolution1
        habit.evolveLevel = habit.evolveLevel * 3
        habit.profile = habit.profile1
      }
    } else if habit.level == 15 {
      congratsPopup(habit.level)
      try! realm.write {
        habit.habitmon = habit.evolution2
        habit.image = habit.evolution2
        habit.evolveLevel = habit.evolveLevel * 2
        habit.profile = habit.profile2
      }
    } else if habit.level == 30 {
      //      print("CHANGE THIS BACK TO 30 BEFORE DEPLOYMENT.")
      congratsPopup(habit.level)
      try! realm.write {
        habit.habitmon = habit.evolution3
        habit.image = habit.evolution3
        habit.evolveLevel = habit.evolveLevel * 2
        habit.profile = habit.profile3
        habit.cheatDays = 3
        
        
        //if this habitmon chain does not already exist in the Collection
        if realm.objects(Collection).filter("habit = \"" + habit.name! + "\"").count == 0 {
          // add this habit to the Collection, as 3 different instances (because the Collection is based on habitmon, not habits... maybe should have organized the whole thing that way, haha)
          realm.create(Collection.self, value: ["name": "\(habit.evolution1!)", "habit": "\(habit.name!)", "category": "\(habit.category!)", "image": "\(habit.evolution1!)", "profile": "\(habit.profile1!)"])
          
          realm.create(Collection.self, value: ["name": "\(habit.evolution2!)", "habit": "\(habit.name!)", "category": "\(habit.category!)", "image": "\(habit.evolution2!)", "profile": "\(habit.profile2!)"])
          
          realm.create(Collection.self, value: ["name": "\(habit.evolution3!)", "habit": "\(habit.name!)", "category": "\(habit.category!)", "image": "\(habit.evolution3!)", "profile": "\(habit.profile3!)"])
        }
        
      }
      
      // every 30 levels, cheat days are replenished
      cheatDaysButton.enabled = true
    }
    // golden evolution form, for later if time
    //    } else if habit.level == 60 {
    //      habit.habitmon = habit.evolution4
    //      habit.image = habit.evolution4
    //      habit.profile = habit.profile4
    
    // create a new instance in Collection, just of Golden habitmon
    //    }
  }


  // MARK: - Actions

  @IBAction func checkboxTapped(sender: UIButton) {
    // change to checked-off image of checkbox
    // why is this not staying checked-off?
    checkboxButton.setBackgroundImage(UIImage(named: "checkedOff"), forState: UIControlState.Normal)
    
    // level-up related code.... this whole thing should be in its own method on the Model but I can't figure out how to connect to that right now so HERE WE ARE. GOTTA SHIP SHIP SHIP.
//    let realm = try! Realm()
    
    try! realm.write {
      habit.level += 1
      habit.checked = true
      habit.updatedAt = NSDate()
    }
    
    levelUpResults()
        
    // update the labels
    levelValue = habit.level
    habitmonNameText = habit.habitmon!
    habitmonImageView = UIImage(named: habit.image!)
    habitmonDescriptionText = habit.profile!
    evolveLevelText = habit.evolveLevel
    
    // turn off checkbox
    checkboxButton.enabled = false
  }
  
  
  @IBAction func useCheatButton(sender: UIButton) {
    
    // only if the user has cheat days remaining for this habit
    if habit.cheatDays >= 1 {
      try! realm.write {
        habit.cheatDays -= 1
      }
    } else {
      let noMoreCheatsAlert = UIAlertController(title: "Out Of Cheat Days", message: "Sorry, but you have used all your cheat days for this month. This habit will be deleted and you must hatch it again.", preferredStyle: UIAlertControllerStyle.Alert)
      
      noMoreCheatsAlert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action: UIAlertAction!) in
        // reset habit to its original state
        try! self.realm.write {
          self.habit.active = false
          self.habit.level = 0
          self.habit.evolveLevel = 5
          self.habit.checked = false
          self.habit.cheatDays = 3
          self.habit.habitmon = "Egg"
          self.habit.image = "Egg"
          self.habit.profile = "A mysterious egg. I wonder what's inside?"
          self.habit.updatedAt = NSDate()
        }
        
        // force segue back to table view?
        self.performSegueWithIdentifier("unwindToHabits", sender: self)
        
      }))
      
      noMoreCheatsAlert.addAction(UIAlertAction(title: "Cancel", style: .Default, handler: { (action: UIAlertAction!) in
        print("Oops, didn't mean to click that.")
      }))
      
      presentViewController(noMoreCheatsAlert, animated: true, completion: nil)
    }
    
    // update image
    cheatDaysHearts = UIImage(named: "hearts\(habit.cheatDays)")
  }
  
}
