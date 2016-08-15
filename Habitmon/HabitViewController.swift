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
    
    // set checkbox to its unchecked state
    checkboxButton.setBackgroundImage(UIImage(named: "emptyCheckbox"), forState: UIControlState.Normal)
    
    
    // connects to property observer so that it can update level number in real time
    levelValue = habit.level
    habitNameText = habit.name!
    habitmonNameText = habit.habitmon!
    habitmonDescriptionText = habit.profile!
    habitmonImageView = UIImage(named: habit.image!)
    evolveLevelText = habit.evolveLevel
    
    //to account for eggs hatching
//    if habit.level < 5 {
//      evolveLevelLabel.text = "Hatches at level " + String(habit.evolveLevel)
//    } else {
//      evolveLevelLabel.text = "Evolves at level " + String(habit.evolveLevel)
//    }
  }


  // MARK: - Actions

  @IBAction func checkboxTapped(sender: UIButton) {
    // change to checked-off image of checkbox
    checkboxButton.setBackgroundImage(UIImage(named: "checkedOff"), forState: UIControlState.Normal)
    
    // level-up related code.... this whole thing should be in its own method on the Model but I can't figure out how to connect to that right now so HERE WE ARE. GOTTA SHIP SHIP SHIP.
    let realm = try! Realm()
    
    try! realm.write {
      habit.level += 1
    }
    
    if habit.level == 5 {
      //magic number for now, fix later
//      evolveLevelLabel.text = "Evolves at level 15"
      try! realm.write {
        habit.habitmon = habit.evolution1
        habit.image = habit.evolution1
        habit.evolveLevel = habit.evolveLevel * 3
      }
    } else if habit.level == 15 {
//      evolveLevelLabel.text = "Evolves at level 30"
      try! realm.write {
        habit.habitmon = habit.evolution2
        habit.image = habit.evolution2
        habit.evolveLevel = habit.evolveLevel * 2
      }
    } else if habit.level == 30 {
//      evolveLevelLabel.text = "Evolves at level 60"
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
    
    //update the labels
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
