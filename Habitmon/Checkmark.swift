//
//  Checkmark.swift
//  Habitmon
//
//  Created by VAL on 2016/08/12.
//  Copyright © 2016年 VAL. All rights reserved.
//

import UIKit

class Checkmark: UIView {
  
//  var habit: Habit!

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    let checkbox = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    //checkbox.backgroundColor = UIColor.redColor()
    
    let emptyCheckboxImage = UIImage(named: "emptyCheckbox")
    let checkedOffImage = UIImage(named: "checkedOff")
    
    checkbox.setImage(emptyCheckboxImage, forState: .Normal)
    checkbox.setImage(checkedOffImage, forState: .Selected)
    
    
    checkbox.addTarget(self, action: #selector(Checkmark.checkboxTapped(_:)), forControlEvents: .TouchDown)
    
    addSubview(checkbox)
    
  }
  
  func checkboxTapped(checkbox: UIButton) {
    print("Ka-ching!")
    //checkbox.backgroundColor = UIColor.greenColor()
    print(checkbox.selected)
    checkbox.selected = true
    print(checkbox.selected)
//    checkbox.setImage(<#T##image: UIImage?##UIImage?#>, forState: <#T##UIControlState#>)
  }

}
