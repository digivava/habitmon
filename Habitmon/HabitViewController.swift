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
    
    //to account for eggs hatching
    if habit.level < 5 {
      evolveLevelLabel.text = "Hatches at level " + String(habit.evolveLevel)
    } else {
      evolveLevelLabel.text = "Evolves at level " + String(habit.evolveLevel)
    }
  }


//func checkboxTapped(checkbox: UIButton) {
//  print("Ka-ching!")
//  checkbox.selected = true
//  let realm = try! Realm()
//  
//  
//  //    try! realm.write {
//  //      habit.level += 1
//  //    }
//  
//}


  // MARK: - Actions

  @IBAction func checkboxTapped(sender: UIButton) {
    
    checkboxButton.setBackgroundImage(UIImage(named: "checkedOff"), forState: UIControlState.Normal)
    
    let realm = try! Realm()
    
    try! realm.write {
      habit.level += 1
    }
    
    levelValue = habit.level
  
  }
  
  

  
  // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
// override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//         //Get the new view controller using segue.destinationViewController.
//         //Pass the selected object to the new view controller.
//    }

}
