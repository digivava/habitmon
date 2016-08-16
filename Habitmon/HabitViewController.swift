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

  var habit: Habit!
  
  // MARK: - Properties
  @IBOutlet weak var habitNameLabel: UILabel!
  @IBOutlet weak var habitmonImage: UIImageView!
  @IBOutlet weak var levelNumberLabel: UILabel!
  @IBOutlet weak var habitmonNameLabel: UILabel!
  @IBOutlet weak var habitmonDescription: UILabel!
  @IBOutlet weak var evolveLevelLabel: UILabel!
  @IBOutlet weak var checkboxButton: UIButton!
  
  // property observers, for updating values in real time. need to do this with the picture soon too.
  var levelValue: Int = 0 {
    didSet {
      levelNumberLabel.text = "level \(levelValue)"
    }
  }
  
  var habitNameText: String = "" {
    didSet {
      habitNameLabel.text = "\(habitNameText)"
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
  
  
  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
    print("After loading page: checked? is \(habit.checked)")
    // can't interact with checkbox if already has been checked
    if habit.checked == true {
      checkboxButton.setBackgroundImage(UIImage(named: "checkedOff"), forState: UIControlState.Normal)
      checkboxButton.enabled = false
    } else {
      checkboxButton.setBackgroundImage(UIImage(named: "emptyCheckbox"), forState: UIControlState.Normal)
    }
    
    print(UIControlState.Normal)
    
    // connects to property observer so that it can update level number in real time
    levelValue = habit.level
    habitNameText = habit.name!
    habitmonNameText = habit.habitmon!
    habitmonDescriptionText = habit.profile!
    habitmonImageView = UIImage(named: habit.image!)
    evolveLevelText = habit.evolveLevel
  }
  
  func congratsPopup(level: Int) {
    
    let congratsAlert = UIAlertController(title: "Congratulations!", message: "", preferredStyle: UIAlertControllerStyle.Alert)
    
    if level == 5 {
      congratsAlert.message = "Your egg has finally hatched! Keep working hard and your Habitmon will evolve!"
    } else if level == 15 {
      congratsAlert.message = "You're doing so well with your habit that your Habitmon just evolved! Keep it up!"
    } else if level == 30 {
      congratsAlert.message = "Incredible! You've done your habit for a whole month now! Your Habitmon and its previous evolutions will be added to the Collection."
    }
    
    congratsAlert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action: UIAlertAction!) in
      print("Habitmon evolved.")
    }))
    
    presentViewController(congratsAlert, animated: true, completion: nil)
  }


  // MARK: - Actions

  @IBAction func checkboxTapped(sender: UIButton) {
    // change to checked-off image of checkbox
    // why is this not staying checked-off?
    checkboxButton.setBackgroundImage(UIImage(named: "checkedOff"), forState: UIControlState.Normal)
    
    // level-up related code.... this whole thing should be in its own method on the Model but I can't figure out how to connect to that right now so HERE WE ARE. GOTTA SHIP SHIP SHIP.
    let realm = try! Realm()
    
    try! realm.write {
      habit.level += 1
      habit.checked = true
    }
    
    print("After checking box: checked? is \(habit.checked)")
    
    if habit.level == 5 {
      congratsPopup(habit.level)
      try! realm.write {
        habit.habitmon = habit.evolution1
        habit.image = habit.evolution1
        habit.evolveLevel = habit.evolveLevel * 3
      }
    } else if habit.level == 15 {
      congratsPopup(habit.level)
      try! realm.write {
        habit.habitmon = habit.evolution2
        habit.image = habit.evolution2
        habit.evolveLevel = habit.evolveLevel * 2
      }
    } else if habit.level == 30 {
      congratsPopup(habit.level)
      try! realm.write {
        habit.habitmon = habit.evolution3
        habit.image = habit.evolution3
        habit.evolveLevel = habit.evolveLevel * 2
      }
    }
    // golden evolution form, for later if time
//    } else if habit.level == 60 {
//      habit.habitmon = habit.evolution4
//      habit.image = habit.evolution4
//    }
    
    // update the labels
    levelValue = habit.level
    habitmonNameText = habit.habitmon!
    habitmonImageView = UIImage(named: habit.image!)
    evolveLevelText = habit.evolveLevel
  }
  
  

  
  // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
// override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//         //Get the new view controller using segue.destinationViewController.
//         //Pass the selected object to the new view controller.
//    let name = habitNameText ?? ""
//    let image = habit.image ?? ""
//    let level = levelValue
//    
//    // Set the meal to be passed to MealListTableViewController after the unwind segue.
//  habit = Habit(name: name, image: image, level: level)
//  
//  }

}
