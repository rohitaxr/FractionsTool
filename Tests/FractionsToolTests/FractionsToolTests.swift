import XCTest
@testable import FractionsTool  // Importing the name of our moudle i.e FractionsTool here.

final class FractionToolTests: XCTestCase {
    
    // This function test the addition part.
    func testAddition() {
        
        // This is testing the whole operation and comparing the fraction.
        let fraction1 = getNumberInNumeratorDenominator(strNumber: "2&3/8")
        let fraction2 = getNumberInNumeratorDenominator(strNumber: "9/8")
        
        XCTAssertTrue(fraction1 != nil, Messages.strTestCaseInvalidParameter.rawValue)
        XCTAssertTrue(fraction2 != nil, Messages.strTestCaseInvalidParameter.rawValue)
        
        if let fraction3 = fraction1,
            let fraction4 = fraction2 {
            var result = performOperation(leftSide: fraction3, rightSide: fraction4, strOperator: "+")!
            XCTAssertEqual(result.convertToFraction(), "1&14/8", Messages.strTestCaseErrorMessage.rawValue)
        }
    }
    
    // This function test the subtraction part.
    func testSubtraction() {
        
        // This is testing the whole operation and comparing the fraction.
        let fraction1 = getNumberInNumeratorDenominator(strNumber: "1&3/4")
        let fraction2 = getNumberInNumeratorDenominator(strNumber: "2")
        
        XCTAssertTrue(fraction1 != nil, Messages.strTestCaseInvalidParameter.rawValue)
        XCTAssertTrue(fraction2 != nil, Messages.strTestCaseInvalidParameter.rawValue)
        
        if let fraction3 = fraction1,
            let fraction4 = fraction2 {
            var result = performOperation(leftSide: fraction3, rightSide: fraction4, strOperator: "-")!
            XCTAssertEqual(result.convertToFraction(), "-1/7", Messages.strTestCaseErrorMessage.rawValue)
        }
    }
    
    // This function test the multiplication part.
    func testMultiplication() {
        
        // This is testing the whole operation and comparing the fraction.
        let fraction1 = getNumberInNumeratorDenominator(strNumber: "3&3/4")
        let fraction2 = getNumberInNumeratorDenominator(strNumber: "1/2")
        
        XCTAssertTrue(fraction1 != nil, Messages.strTestCaseInvalidParameter.rawValue)
        XCTAssertTrue(fraction2 != nil, Messages.strTestCaseInvalidParameter.rawValue)
        
        if let fraction3 = fraction1,
            let fraction4 = fraction2 {
            var result = performOperation(leftSide: fraction3, rightSide: fraction4, strOperator: "*")!
            XCTAssertEqual(result.convertToFraction(), "4&1/7", Messages.strTestCaseErrorMessage.rawValue)
        }
    }
    
    // This function test the division part.
    func testDivision() {
        
        // This is testing the whole operation and comparing the fraction.
        let fraction1 = getNumberInNumeratorDenominator(strNumber: "7")
        let fraction2 = getNumberInNumeratorDenominator(strNumber: "1/2")
        
        XCTAssertTrue(fraction1 != nil, Messages.strTestCaseInvalidParameter.rawValue)
        XCTAssertTrue(fraction2 != nil, Messages.strTestCaseInvalidParameter.rawValue)
        
        if let fraction3 = fraction1,
            let fraction4 = fraction2 {
            var result = performOperation(leftSide: fraction3, rightSide: fraction4, strOperator: "/")!
            XCTAssertEqual(result.convertToFraction(), "14", Messages.strTestCaseErrorMessage.rawValue)
        }
    }
}
