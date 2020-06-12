//
//  CalculatorUITests.swift
//  CalculatorUITests
//
//  Created by suitecontrol on 12/6/20.
//

import XCTest

class CalculatorUITests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        app = XCUIApplication()
        app.launch()

    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    /**
     * Makes sure the maximum length allowed is 9 digits
     *
     * This also tests the number button tag labelled correctly
     */
    func testNumberLength() {
        app.buttons["1"].tap()
        app.buttons["2"].tap()
        app.buttons["3"].tap()
        app.buttons["4"].tap()
        app.buttons["5"].tap()
        app.buttons["6"].tap()
        app.buttons["7"].tap()
        app.buttons["8"].tap()
        app.buttons["9"].tap()
        app.buttons["9"].tap()
        let resultLabel = app.staticTexts["ResultLabel"]
        XCTAssertEqual(resultLabel.label, "123456789")
    }

    /**
     * Makes sure the maximum length allowed is 8 digits and a dot (9 in total)
     */
    func testDecimalNumberLength() {
        app.buttons["1"].tap()
        app.buttons["2"].tap()
        app.buttons["3"].tap()
        app.buttons["4"].tap()
        app.buttons["5"].tap()
        app.buttons["6"].tap()
        app.buttons["7"].tap()
        app.buttons["."].tap()
        app.buttons["8"].tap()
        app.buttons["9"].tap()
        let resultLabel = app.staticTexts["ResultLabel"]
        XCTAssertEqual(resultLabel.label, "1234567.8")
    }
    
    /**
     * Makes sure it handles the error when user accidentally types in dot (.) more than once
     */
    func testErrorHandlingDots() {
        app.buttons["1"].tap()
        app.buttons["2"].tap()
        app.buttons["3"].tap()
        app.buttons["."].tap()
        app.buttons["."].tap()
        app.buttons["4"].tap()
        app.buttons["5"].tap()
        app.buttons["6"].tap()
        app.buttons["."].tap()
        app.buttons["3"].tap()
        let resultLabel = app.staticTexts["ResultLabel"]
        XCTAssertEqual(resultLabel.label, "123.4563")
    }

    /**
     * Makes sure clear all button clears everything
     */
    func testClearAllButton() {
        let app = XCUIApplication()
        app.buttons["1"].tap()
        app.buttons["2"].tap()
        app.buttons["3"].tap()
        app.buttons["4"].tap()
        app.buttons["5"].tap()
        app.buttons["6"].tap()
        app.buttons["7"].tap()
        app.buttons["8"].tap()
        app.buttons["9"].tap()
        app.buttons["×"].tap()
        app.buttons["="].tap()
        app.buttons["AC"].tap()
        let resultLabel = app.staticTexts["ResultLabel"]
        XCTAssertEqual(resultLabel.label, "0")
    }
    
    func testMultiply() {
        app.buttons["9"].tap()
        app.buttons["×"].tap()
        app.buttons["9"].tap()
        app.buttons["×"].tap()
        app.buttons["9"].tap()
        app.buttons["="].tap()
        var expectedResult = "\(Double(Double(9)*Double(9)*Double(9)))"
        if Double(expectedResult)!.truncatingRemainder(dividingBy: 1) == 0 {
            expectedResult = "\(Int(Double(expectedResult)!))"
        }
        let resultLabel = app.staticTexts["ResultLabel"]
        XCTAssertEqual(resultLabel.label, expectedResult)
    }
    
    func testDivide() {
        app.buttons["9"].tap()
        app.buttons["÷"].tap()
        app.buttons["9"].tap()
        app.buttons["÷"].tap()
        app.buttons["9"].tap()
        app.buttons["="].tap()
        var expectedResult = "\(Double(Double(9)/Double(9)/Double(9)))"
        if Double(expectedResult)!.truncatingRemainder(dividingBy: 1) == 0 {
            expectedResult = "\(Int(Double(expectedResult)!))"
        }
        let resultLabel = app.staticTexts["ResultLabel"]
        XCTAssertEqual(resultLabel.label, expectedResult)
    }

    func testAdd() {
        app.buttons["1"].tap()
        app.buttons["+"].tap()
        app.buttons["2"].tap()
        app.buttons["+"].tap()
        app.buttons["3"].tap()
        app.buttons["="].tap()
        var expectedResult = "\(Double(Double(1)+Double(2)+Double(3)))"
        if Double(expectedResult)!.truncatingRemainder(dividingBy: 1) == 0 {
            expectedResult = "\(Int(Double(expectedResult)!))"
        }
        let resultLabel = app.staticTexts["ResultLabel"]
        XCTAssertEqual(resultLabel.label, expectedResult)
    }
    
    func testMinus() {
        app.buttons["5"].tap()
        app.buttons["-"].tap()
        app.buttons["2"].tap()
        app.buttons["-"].tap()
        app.buttons["9"].tap()
        app.buttons["="].tap()
        var expectedResult = "\(Double(Double(5)-Double(2)-Double(9)))"
        if Double(expectedResult)!.truncatingRemainder(dividingBy: 1) == 0 {
            expectedResult = "\(Int(Double(expectedResult)!))"
        }
        let resultLabel = app.staticTexts["ResultLabel"]
        XCTAssertEqual(resultLabel.label, expectedResult)
    }

    func testDivideByZero() {
        app.buttons["1"].tap()
        app.buttons["÷"].tap()
        app.buttons["0"].tap()
        app.buttons["÷"].tap()
        app.buttons["9"].tap()
        app.buttons["="].tap()
        let resultLabel = app.staticTexts["ResultLabel"]
        XCTAssertEqual(resultLabel.label, "Error")
    }
    
    func testCombinationOperations() {
        app.buttons["1"].tap()
        app.buttons["+"].tap()
        app.buttons["2"].tap()
        app.buttons["-"].tap()
        app.buttons["3"].tap()
        app.buttons["×"].tap()
        app.buttons["4"].tap()
        app.buttons["÷"].tap()
        app.buttons["5"].tap()
        app.buttons["="].tap()
        var expectedResult = "\(Double((((Double(1)+Double(2))-Double(3))*Double(4))/Double(5)))"
        if Double(expectedResult)!.truncatingRemainder(dividingBy: 1) == 0 {
            expectedResult = "\(Int(Double(expectedResult)!))"
        }
        let resultLabel = app.staticTexts["ResultLabel"]
        XCTAssertEqual(resultLabel.label, expectedResult)
    }

}
