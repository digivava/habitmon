//
//  MainViewController.swift
//  Habitmon
//
//  Created by VAL on 2016/08/08.
//  Copyright © 2016年 VAL. All rights reserved.
//

import UIKit
import RealmSwift

class MainViewController: UITableViewController {

  var objects = [AnyObject]()
  
//  let realm = try! Realm()
//  lazy var habits: Results<Habit> = { self.realm.objects(Habit) }()


  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
//    let defaultRealm = try! Realm()
//    populateHabitsList(defaultRealm)
    }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: - Habit List Actions
  
//  func populateHabitsList(realm: Realm) {
//    var userHabits = realm.objects(Habit.self).filter("status = 'active'")
//  }

}

