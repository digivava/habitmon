//
//  HabitViewController.swift
//  Habitmon
//
//  Created by VAL on 2016/08/11.
//  Copyright © 2016年 VAL. All rights reserved.
//

import UIKit

class HabitViewController: UIViewController {

  var habit: Habit!
  
  // MARK: - Properties
  @IBOutlet weak var habitNameLabel: UILabel!
  @IBOutlet weak var habitmonImage: UIImageView!
  @IBOutlet weak var levelNumberLabel: UILabel!
  @IBOutlet weak var habitmonNameLabel: UILabel!
  @IBOutlet weak var habitmonDescription: UILabel!
  @IBOutlet weak var evolveLevelLabel: UILabel!
  
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
    
    // connects to property observer so that it can update level number in real time
    levelValue = habit.level
    habitNameText = habit.name!
    habitmonNameText = habit.habitmon!
    habitmonDescriptionText = habit.profile!
    habitmonImageView = UIImage(named: habit.image!)
    
    
    
//    if habit.level < 5 {
//      // egg
//      habitmonNameLabel.text = "Egg"
//      habitmonImage.image = UIImage(named: "egg")
//      habitmonDescription.text = "A mysterious egg. I wonder what could be inside?"
//    } else if habit.level >= 5 && habit.level < 15 {
//      // stage 1 habitmon e.g., lollipup
//      habitmonNameLabel.text = habit.habitmon1
//      habitmonImage.image = UIImage(named: habit.image!)
//      habitmonDescription.text = habit.description1
//    } else if habit.level >= 15 && habit.level < 30 {
//      // stage 2 habitmon e.g., sugpug
//      habitmonNameLabel.text = habit.habitmon2
//      habitmonImage.image = UIImage(named: habit.image!)
//      habitmonDescription.text = habit.description2
//    } else if habit.level >= 30 && habit.level < 60 {
//      // stage 3 habitmon e.g. molassie (success! this evolution chain gets added to your collection!)
//      habitmonNameLabel.text = habit.habitmon3
//      habitmonImage.image = UIImage(named: habit.image!)
//      habitmonDescription.text = habit.description3
//    } else {
//      //overachievers get the golden habitmon, e.g. golden molassie
//      habitmonNameLabel.text = "Golden " + habit.habitmon3
//      // basically same image as image3 but golden
//      habitmonImage.image = UIImage(named: habit.image!)
//      habitmonDescription.text = "It shines with such splendor. A sparkling beacon of hope on the road to glory."
//    }
    
    //to account for eggs hatching
    if habit.level < 5 {
      evolveLevelLabel.text = "Hatches at level " + String(habit.evolveLevel)
    } else {
      evolveLevelLabel.text = "Evolves at level " + String(habit.evolveLevel)
    }
  }

  
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
// override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//         //Get the new view controller using segue.destinationViewController.
//         //Pass the selected object to the new view controller.
//    }

}
