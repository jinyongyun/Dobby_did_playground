//
//  RoundButton.swift
//  Basic Calculator
//
//  Created by mac on 2022/06/29.
//

import UIKit
@IBDesignable
class RoundButton: UIButton {
 
  @IBInspectable var isRound: Bool = false {
        didSet {
            self.layer.cornerRadius = self.frame.height / 2
        }
        
    }

}
