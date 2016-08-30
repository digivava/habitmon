//
//  CollectionViewController.swift
//  Habitmon
//
//  Created by VAL on 2016/08/23.
//  Copyright © 2016年 VAL. All rights reserved.
//

import UIKit
import RealmSwift

class CollectionViewController: UIViewController {
  
  let realm = try! Realm()
  var habitmon: Collection!

  @IBOutlet weak var habitmonImage: UIImageView!
  @IBOutlet weak var habitmonName: UILabel!
  @IBOutlet weak var dateAdded: UILabel!
  @IBOutlet weak var habitmonDescription: UILabel!
  
  
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      habitmonImage.image = UIImage(named: habitmon.image)
      habitmonName.text = habitmon.name
      habitmonDescription.text = habitmon.profile
      
      // get just the year from the createdAt date
      let calendar = NSCalendar.currentCalendar()
      let components = calendar.components([.Day , .Month , .Year], fromDate: habitmon.createdAt)
      
      let month = components.month
      let day = components.day
      let year =  components.year
      dateAdded.text = "You unlocked this Habitmon on \(month)-\(day)-\(year)."
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
