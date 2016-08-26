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
  
  let realm = try! Realm()
  
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
  
  
  func seedHabits() {
    print("bleh")
    try! realm.write {
      realm.create(Habit.self, value: ["id": 1, "name": "No sweets", "category": "Diet", "evolution1": "Lollipup", "evolution2": "Sugpug", "evolution3": "Molassie", "profile1": "Happily feasts on all the sugar you aren't eating. Particularly enjoys smugly eating your favorites right next to you. But such a loyal and cuddly friend, you can't help but stay near it.", "profile2": "Hordes a stash of gooey, fresh-baked chocolate chip cookies in its doghouse and gets vicious if you try to snag any. Likes belly-rubs.", "profile3": "A powerful yet flighty spirit that rarely shows itself to humans. Legend says it comes only to those who prove themselves as truly self-disciplined."])
      
      realm.create(Habit.self, value: ["id": 2, "name": "Write 1000 words", "category": "Creative", "evolution1": "Wordvark", "evolution2": "Pengolin", "evolution3": "Bookupine", "profile1": "Patches of its skin open up to reveal inspiring passages from great works of literature, tragically relevant poetry, and occasionally trashy clickbait articles from the Internet.", "profile2": "Its ink-tipped tongue can produce manuscripts at 200 WPM. Does its best thinking in the early morning.", "profile3": "Its awkward introversion leads to it often being misunderstood. Uses its fountain-pen quills to work on many projects at once. Likes to be given coffee in its water bowl."])
      
      realm.create(Habit.self, value: ["id": 3, "name": "Practice foreign language", "category": "Study", "evolution1": "Speakter", "evolution2": "Bilinghoul", "evolution3": "Langwitch", "profile1": "A prideful Habitmon that is especially proficient in pig Latin. Its ghostly transparency frustrates you because of how squeezable it looks.", "profile2": "Knows all sorts of obscure, spooky nursery rhymes in other languages, and whispers them to you while you sleep.", "profile3": "It cooks a variety of foods from your target language's country, but if you don't like the taste it will screech profanities that you haven't learned yet."])
      
      realm.create(Habit.self, value: ["id": 4, "name": "Work out", "category": "Fitness", "evolution1": "Musscle", "evolution2": "Barnuckle", "evolution3": "Shellflex", "profile1": "Gives great motivational speeches. You are unsure of where it hides its unlimited supply of sports drinks.", "profile2": "Expert high-five giver and beloved by all, but often feels bashful about the fishy smell of its sweat.", "profile3": "Has high expectations, as a former trainer of Olympic athletes. Affectionately calls you 'pansy'."])
      
      
      
    }
  }
  
  
}
