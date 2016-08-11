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
  dynamic var habitmon: String?
  dynamic var level: Int = 0
  dynamic var evolveLevel: Int = 10
  //this needs to be a UIImage eventually, but it should start as NSData type
  dynamic var image: String?
  dynamic var profile: String?
  dynamic var cheatDays: Int = 3
  dynamic var checked: Bool = false
  dynamic var category: String?
  dynamic var createdAt = NSDate()
  dynamic var updatedAt = NSDate()
  
//  // makes the id the key
//  override static func primaryKey() -> String? {
//    return "id"
//  }
  
}
