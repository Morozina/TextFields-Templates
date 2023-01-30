//
//  UITests.swift
//  UITests
//
//  Created by Vladyslav Moroz on 22/11/2022.
//

import XCTest

final class UITests: XCTestCase {
    let app = XCUIApplication()
    
    override func setUp() {
        app.launch()
    }
    
    func testNoNumbersTextField() throws {
        prepareTextField("Hello World", "noNumbersTextField")
        XCTAssertEqual(app.textFields["noNumbersTextField"].value as! String, "Hello World")
        
        prepareTextField("Hello Foxmieded 24/7", "noNumbersTextField")
        XCTAssertNotEqual(app.textFields["noNumbersTextField"].value as! String, "Hello Foxmineded 24/7")
    }
    
    func testLimitedLineTextField() {
        prepareTextField("Hello World its Second Text Field", "limitedLineTextField")
        XCTAssertEqual(app.textFields["limitedLineTextField"].value as! String, "Hello World its Second Text Field")
        XCTAssertEqual(app.staticTexts["scoreLabel"].label, " -23  ")
    }
    
    func testMaskedTextField() {
        prepareTextField("Amigo12345", "withPyphenTextField")
        XCTAssertEqual(app.textFields["withPyphenTextField"].value as! String, "Amigo-12345")
    }
    
    func testOpenLinkTextField() {
        prepareTextField("abc.com", "openLinkTextField")
        let doneButton = app.buttons["Done"]
        doneButton.tap()
    }
    
    func testPasswordTextField() {
        setUp()
        app.secureTextFields["passwordTextField"].tap()
        app.secureTextFields["passwordTextField"].typeText("Hello")
        XCTAssert(app.progressIndicators["progressBar"].value as! String == "50%")
    }
    
    func prepareTextField(_ string: String, _ textField: String) {
        setUp()
        app.textFields["\(textField)"].tap()
        app.textFields["\(textField)"].typeText(string)
    }
    
    func testInitialState() {
        XCTAssertTrue(app.textFields["noNumbersTextField"].exists)
        XCTAssertTrue(app.textFields["limitedLineTextField"].exists)
        XCTAssertTrue(app.textFields["withPyphenTextField"].exists)
        XCTAssertTrue(app.textFields["openLinkTextField"].exists)
        XCTAssertTrue(app.secureTextFields["passwordTextField"].exists)

        XCTAssertTrue(app.staticTexts["eightLettersLabel"].exists)
        XCTAssertTrue(app.staticTexts["numInPasswordLabel"].exists)
        XCTAssertTrue(app.staticTexts["lowerCaseSymbholLabel"].exists)
        XCTAssertTrue(app.staticTexts["upperCaseSymbholLabel"].exists)
        XCTAssertTrue(app.progressIndicators["progressBar"].exists)
    }
}
