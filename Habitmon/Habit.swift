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
  dynamic var name: String?
  dynamic var active: Bool = false
  dynamic var level: Int = 0
  dynamic var evolveLevel: Int = 5
  dynamic var cheatDays: Int = 3
  dynamic var checked: Bool = false
  dynamic var category: String?
  dynamic var createdAt = NSDate()
  dynamic var updatedAt = NSDate()
  
  // for the different evolutionary stages of the habitmon
  dynamic var habitmon: String?
  dynamic var image: String?
  
  // okay so I guess arrays are hard in realm
//  let evolutions = List<String>()
  dynamic var evolution1: String?
  dynamic var evolution2: String?
  dynamic var evolution3: String?
  dynamic var evolution4: String?

  dynamic var profile: String?
  
//  // makes the id the key
//  override static func primaryKey() -> String? {
//    return "id"
//  }
  
  func levelUp(habit: Habit) {
    level += 1
    
//    if level == 5 {
//      habitmon = evolution1
//      image = evolution1
//    } else if level == 15 {
//      habitmon = evolution2
//      image = evolution2
//    } else if level == 30 {
//      habitmon = evolution3
//      image = evolution3
//    } else if level == 60 {
//      habitmon = evolution4
//      image = evolution4
//    }
  }
  
}
