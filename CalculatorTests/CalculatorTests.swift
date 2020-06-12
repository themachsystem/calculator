//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by suitecontrol on 11/6/20.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {

    var sut: MainViewController!
    var leftOperand = 9999
    let rightOperand = 999
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "MainViewController") as? MainViewController
        _ = UINavigationController(rootViewController: sut)
        //load view hierarchy
        _ = sut.view
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    func testSUT_CanBeInstantiated() {
        XCTAssertNotNil(sut)
    }

    func testCalculator_Addition() {
        sut.numberOnScreen = "\(leftOperand)"
        sut.make(operation: .Add)
        sut.numberOnScreen = "\(rightOperand)"
        sut.make(operation: sut.currentOperation)
        var expectedResult = "\(Double(leftOperand) + Double(rightOperand))"
        if Double(expectedResult)!.truncatingRemainder(dividingBy: 1) == 0 {
            expectedResult = "\(Int(Double(expectedResult)!))"
        }
        XCTAssertEqual(sut.result, expectedResult)
    }
    
    func testCalculator_Subtract() {
        sut.numberOnScreen = "\(leftOperand)"
        sut.make(operation: .Subtract)
        sut.numberOnScreen = "\(rightOperand)"
        sut.make(operation: sut.currentOperation)
        var expectedResult = "\(Double(leftOperand) - Double(rightOperand))"
        if Double(expectedResult)!.truncatingRemainder(dividingBy: 1) == 0 {
            expectedResult = "\(Int(Double(expectedResult)!))"
        }
        XCTAssertEqual(sut.result, expectedResult)
    }

    func testCalculator_Multiply() {
        sut.numberOnScreen = "\(leftOperand)"
        sut.make(operation: .Multiply)
        sut.numberOnScreen = "\(rightOperand)"
        sut.make(operation: sut.currentOperation)
        var expectedResult = "\(Double(leftOperand) * Double(rightOperand))"
        if Double(expectedResult)!.truncatingRemainder(dividingBy: 1) == 0 {
            expectedResult = "\(Int(Double(expectedResult)!))"
        }
        XCTAssertEqual(sut.result, expectedResult)
    }
    
    func testCalculator_Divide() {
        sut.numberOnScreen = "\(leftOperand)"
        sut.make(operation: .Divide)
        sut.numberOnScreen = "\(rightOperand)"
        sut.make(operation: sut.currentOperation)
        var expectedResult = "\(Double(leftOperand) / Double(rightOperand))"
        if Double(expectedResult)!.truncatingRemainder(dividingBy: 1) == 0 {
            expectedResult = "\(Int(Double(expectedResult)!))"
        }
        XCTAssertEqual(sut.result, expectedResult)
    }
    
    func testCalculator_DivideByZero() {
        sut.numberOnScreen = "1"
        sut.make(operation: .Divide)
        sut.numberOnScreen = "0"
        sut.make(operation: sut.currentOperation)
        XCTAssertEqual(sut.result, "Error")
    }
}
