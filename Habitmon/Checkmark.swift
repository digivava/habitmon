//
//  Checkmark.swift
//  Habitmon
//
//  Created by VAL on 2016/08/12.
//  Copyright © 2016年 VAL. All rights reserved.
//

import UIKit

class Checkmark: UIView {

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    let checkbox = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    checkbox.backgroundColor = UIColor.redColor()
    
    checkbox.addTarget(self, action: #selector(Checkmark.checkboxTapped(_:)), forControlEvents: .TouchDown)
    
    addSubview(checkbox)
    
  }
  
  func checkboxTapped(checkbox: UIButton) {
    print("Ka-ching!")
  }

}
