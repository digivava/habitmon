//
//  Habit.swift
//  Habitmon
//
//  Created by VAL on 2016/08/08.
//  Copyright © 2016年 VAL. All rights reserved.
//

import Foundation
import SQLite

class Habit: Database {
  
  // MARK: Properties
  
  var id: Int64?
  var status: String?
  var habitName: String?
  var habitmon: String?
  var level: Int64?
  var evolveLevel: Int64?
  var image: String?
  var description: String?
  var cheatDays: Int64?
  var checked: Bool?
  var category: String?
  //these two should probably be links to id of other habitmon actually
//  var evolvedForm: String?
//  var previousForm: String?
  //figure out how to do timestamps later for createdAt and updatedAt, looks complicated
//  var createdAt: NSDate?
//  var updatedAt: NSDate?

  
  // remember to update these arguments once you add in those other properties
  init(id: Int64, status: String, habitName: String, habitmon: String, level: Int64, evolveLevel: Int64, image: String, description: String, cheatDays: Int64, checked: Bool, category: String) {
    self.id = id
    self.status = status
    self.habitName = habitName
    self.habitmon = habitmon
    self.level = level
    self.evolveLevel = evolveLevel
    self.image = image
    self.description = description
    self.cheatDays = cheatDays
    self.checked = checked
    self.category = category
  }
  
  // MARK: Methods
  
}