//
//  Habit.swift
//  Habitmon
//
//  Created by VAL on 2016/08/08.
//  Copyright © 2016年 VAL. All rights reserved.
//

import Foundation
import RealmSwift

class Habit: Object {
  
  // MARK: Properties
  
  let id = RealmOptional<Int>()
  dynamic var name: String? = ""
  dynamic var active: Bool = false
  dynamic var level: Int = 0
  dynamic var cheatDays: Int = 3
  // use this once you implement a time restriction for the checkbox
  dynamic var checked: Bool = false
  dynamic var category: String? = "Other"
  dynamic var updatedAt = NSDate()
  
  // for the different evolutionary stages of the habitmon
  dynamic var habitmon: String? = "Egg"
  dynamic var image: String? = "Egg"
  
  // okay so I guess arrays are hard in realm
//  let evolutions = List<String>()
  dynamic var evolution1: String? = ""
  dynamic var evolution2: String? = ""
  dynamic var evolution3: String? = ""
  
  dynamic var evolveLevel: Int = 5
//  dynamic var evolveLevel2: Int = 15
//  dynamic var evolveLevel3: Int = 30
//  dynamic var evolveLevel4: Int = 60

  dynamic var profile: String? = "A mysterious egg. I wonder what's inside?"
  dynamic var profile1: String? = "A cute, lovable Habitmon."
  dynamic var profile2: String? = "A bratty teenage Habitmon."
  dynamic var profile3: String? = "A strong, majestic Habitmon."
  
}
