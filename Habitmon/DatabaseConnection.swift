//
//  Database.swift
//  Habitmon
//
//  Created by VAL on 2016/08/08.
//  Copyright © 2016年 VAL. All rights reserved.
//

import Foundation
import SQLite

class DatabaseConnection {
  
  init() {
    //initialize the database
    let db = try Connection("database/db.sqlite3")
  }
  
  func createTable() {
    
  }
  
}