//
//  AppDelegate.swift
//  Habitmon
//
//  Created by VAL on 2016/08/08.
//  Copyright © 2016年 VAL. All rights reserved.
//

import UIKit
//import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    // Override point for customization after application launch.
    
//    let realm = try! Realm()
//    try! realm.write {
//      realm.deleteAll()
//    }
    
//    (REMOVE BEFORE DEPLOYMENT) this is just for clearing the realm database when I need to test it fresh
//    try! realm.write {
//      realm.deleteAll()
//    }
    
//     create all the habits that exist, if they haven't been created already
//    if realm.objects(Habit).count == 0 {
//      try! realm.write {
//        realm.create(Habit.self, value: ["id": 1, "name": "No sweets", "habitmon": "Lollipup"])
//        realm.create(Habit.self, value: ["id": 2, "name": "Floss", "habitmon": "Plaqodile"])
//        realm.create(Habit.self, value: ["id": 3, "name": "Exercise for 15 min", "habitmon": "Musscle"])
//      }
//    }
    
//    let habits = realm.objects(Habit.self)
//    print(habits)
    
    return true
  }

  func applicationWillResignActive(application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
  }

  func applicationDidEnterBackground(application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }

  func applicationWillEnterForeground(application: UIApplication) {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
  }

  func applicationDidBecomeActive(application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }

  func applicationWillTerminate(application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  }

}

