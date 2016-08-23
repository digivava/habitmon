//
//  HabitTableViewCell.swift
//  Habitmon
//
//  Created by VAL on 2016/08/10.
//  Copyright © 2016年 VAL. All rights reserved.
//

import UIKit
import RealmSwift

class HabitTableViewCell: UITableViewCell {
  
  // MARK: Properties
  @IBOutlet weak var habitmonImage: UIImageView!
  @IBOutlet weak var habitNameLabel: UILabel!
  @IBOutlet weak var levelNumberLabel: UILabel!
  
  
  var levelValue: Int = 0 {
    didSet {
      levelNumberLabel.text = "level \(levelValue)"
    }
  }
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
