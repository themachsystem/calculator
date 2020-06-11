//
//  RoundButton.swift
//  Calculator
//
//  Created by suitecontrol on 11/6/20.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {

    @IBInspectable var rounded:Bool = false {
        didSet {
            if rounded {
                layer.cornerRadius = frame.height / 2
            }
        }
    }

    override func prepareForInterfaceBuilder() {
        if rounded {
            layer.cornerRadius = frame.height / 2
        }
    }
}
