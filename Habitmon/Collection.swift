//
//  Collection.swift
//  Habitmon
//
//  Created by VAL on 2016/08/19.
//  Copyright © 2016年 VAL. All rights reserved.
//

import Foundation
import RealmSwift

class Collection: Object {
  
  // MARK: - Properties
  
  //this is the habitmon's name, not the habit this time
  dynamic var name: String = ""
  
  //this is the name of the habit
  dynamic var habit: String = ""
  dynamic var category: String = "Other"
  dynamic var image: String = ""
  dynamic var profile: String = "A happy Habitmon, raised with love."
  dynamic var createdAt = NSDate()
  
}