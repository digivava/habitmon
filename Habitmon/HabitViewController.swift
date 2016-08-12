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
  
  
  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
    habitNameLabel.text = habit.name
    levelNumberLabel.text = "level " + String(habit.level)
    habitmonImage.image = UIImage(named: habit.image!)
    habitmonNameLabel.text = habit.habitmon
    habitmonDescription.text = habit.profile
    evolveLevelLabel.text = "Evolves at level " + String(habit.evolveLevel)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
// override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//         //Get the new view controller using segue.destinationViewController.
//         //Pass the selected object to the new view controller.
//    }

}
