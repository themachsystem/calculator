//
//  MainViewController.swift
//  Calculator
//
//  Created by suitecontrol on 11/6/20.
//

import UIKit

/**
 * Simple maths operations: addition, subtraction, multiplication, division
 */
enum Operation: String {
    case Add = "+"
    case Subtract = "-"
    case Divide = "/"
    case Multiply = "*"
    case Null = "Null"
}

class MainViewController: UIViewController {
    /// The current number that is being displayed in the text area.
    var numberOnScreen = ""
    
    /// The number which is on the left of a calculation operation
    var leftOperand = ""
    
    /// The number which is on the right of a calculation operation
    var rightOperand = ""
    
    /// The final result after calculation
    var result = ""
    
    /// The current operation being used
    var currentOperation: Operation = .Null
    
    
    @IBOutlet weak var resultLabel: UILabel!
    
    // MARK: - IBActions
    @IBAction func allClearTapped(_ sender: RoundButton) {
        numberOnScreen = ""
        leftOperand = ""
        rightOperand = ""
        result = ""
        currentOperation = .Null
        resultLabel.text = "0"
    }
    @IBAction func divideTapped(_ sender: RoundButton) {
        make(operation: .Divide)
    }
    
    @IBAction func multiplyTapped(_ sender: RoundButton) {
        make(operation: .Multiply)
    }
    
    @IBAction func minusTapped(_ sender: RoundButton) {
        make(operation: .Subtract)
    }
    
    @IBAction func plusTapped(_ sender: RoundButton) {
        make(operation: .Add)
    }
    
    @IBAction func equalTapped(_ sender: RoundButton) {
        make(operation: currentOperation)
    }
    
    @IBAction func numberTapped(_ sender: RoundButton) {
        // Limits maximum number to 9 digits
        if numberOnScreen.count <= 8 {
            numberOnScreen += "\(sender.tag - 1)"
            resultLabel.text = numberOnScreen
        }
    }

    @IBAction func dotTapped(_ sender: RoundButton) {
        if numberOnScreen.count <= 7 {
            if numberOnScreen.contains(".") {
                
            } else {
                numberOnScreen += "."
                resultLabel.text = numberOnScreen
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = "0"
        resultLabel.adjustsFontSizeToFitWidth = true
    }

    // MARK: - Private
    /**
     * Performs calculation logics for the specified operation
     *
     * - parameter operation: The maths operation to be processed
     */
    func make(operation: Operation) {
        if currentOperation != .Null {
            if numberOnScreen != "" {
                rightOperand = numberOnScreen
                numberOnScreen = ""
                if currentOperation == .Add {
                    result = "\(Double(leftOperand)! + Double(rightOperand)!)"
                }
                else if currentOperation == .Subtract {
                    result = "\(Double(leftOperand)! - Double(rightOperand)!)"
                }
                else if currentOperation == .Multiply {
                    result = "\(Double(leftOperand)! * Double(rightOperand)!)"
                }
                else if currentOperation == .Divide {
                    result = "\(Double(leftOperand)! / Double(rightOperand)!)"
                }
                leftOperand = result
                if Double(result)!.truncatingRemainder(dividingBy: 1) == 0 {
                    result = "\(Int(Double(result)!))"
                }
                resultLabel.text = result
            }
            currentOperation = operation
        }
        else {
            leftOperand = numberOnScreen
            numberOnScreen = ""
            currentOperation = operation
        }
    }
}

