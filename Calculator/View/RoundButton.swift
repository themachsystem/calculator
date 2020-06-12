//
//  RoundButton.swift
//  Calculator
//
//  Created by suitecontrol on 11/6/20.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {

    /**
     * If true, the border corner will be rounded.
     */
    @IBInspectable var rounded:Bool = false {
        didSet {
            if rounded {
                layer.cornerRadius = 5.0
            }
        }
    }

    override func prepareForInterfaceBuilder() {
        if rounded {
            layer.cornerRadius = 5.0
        }
    }
}
