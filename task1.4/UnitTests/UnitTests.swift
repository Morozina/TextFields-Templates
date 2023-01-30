//
//  UnitTests.swift
//  UnitTests
//
//  Created by Vladyslav Moroz on 21/11/2022.
//

import XCTest
@testable import task1_4

final class UnitTests: XCTestCase {
    
    private var sut: FieldsMeneger!
    
    //MARK: - WITHOUT DIGITS TESTS
    func testFuncWithoutDigit() throws {
        try funcWithoutDigit(charWithoutDigit: "g", charWithDigit: "2")
    }
    
    func funcWithoutDigit(charWithoutDigit: String, charWithDigit: String ) throws {
        let charWithoutDigit = charWithoutDigit
        let charWithDigit = charWithDigit
        let resultWithoutDigit = charWithoutDigit.withoutDigits
        let resultWithDigit = charWithDigit.withoutDigits
        XCTAssertTrue(resultWithoutDigit)
        XCTAssertFalse(resultWithDigit)
    }
    //MARK: - MASKED TEXTFIELD
    func test_correctInputMask() throws {
        let inputText = "sssss444"
        let expectedText = "sssss-444"
        
        let maskedText = sut.maskedText(input: inputText)
        
        XCTAssertEqual(maskedText, expectedText)
    }
    
    func test_wrongInputMask() throws {
        let inputText = "sss-sss444-444"
        let expectedText = "sssss-44444"
        
        let maskedText = sut.maskedText(input: inputText)
        
        XCTAssertEqual(maskedText, expectedText)
    }
    
    override func setUp() {
        super.setUp()
        sut = FieldsMeneger()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
}

