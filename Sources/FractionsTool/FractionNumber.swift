//
//  FractionNumber.swift
//  
//
// 
//

import Foundation

// Structure to show fraction number. Taking numerator and denominator as input and performing various operations on them by using operator overloading.
struct FractionNumber {
    
    var intNumerator: Int
    var intDenominator: Int
    
    // MARK: - Struct initializer method
    init(numerator: Int, denominator: Int) {
        
        self.intNumerator = numerator
        self.intDenominator = denominator
    }
    
    // MARK: - Struct custom methods
    
    // This function is responsible for converting the result to a fraction value.
    mutating func convertToFraction() -> String {
        
        if intDenominator == 0 { // If by chance the denominator is 0 than we are showing error to user.
            fatalError(Messages.strSomethingWentWrong.rawValue)
        }
        else if intDenominator == 1 { // If denominator is 1 than we are just returning numerator value.
            return "\(intNumerator)"
        }
        else if intNumerator < 0 || intDenominator < 0 { // If numerator is negative than we are just returning -numerator/denominator fraction.
            return "\(intNumerator)/\(intDenominator)"
        }
        else { // Else we are calculating the fraction below.
            return calculateFractionValue()
        }
    }
    
    // This function calculate the fraction value for the numerator and denominator and internally calls the function to convert them to string..
    mutating func calculateFractionValue() -> String {
        
        // Finding greatest common divisor for numerator and denominator in order to reduce the fraction.
        let greatestCommonDivisor = findGCD(number1: intNumerator,
                                            number2: intDenominator)
        
        // Reducing the values of numerator and denominator by using gcd value.
        intNumerator /= greatestCommonDivisor
        intDenominator /= greatestCommonDivisor
        
        return getFractionAsString()
    }
    
    // This function finds the gcd for the given 2 numbers.
    func findGCD(number1: Int,
                 number2: Int) -> Int {
        
        let modResult = number1 % number2
        if modResult != 0 {
            return findGCD(number1: number2,
                           number2: modResult)
        }
        else {
            return number2
        }
    }
    
    // This function reduces the fraction to string.
    func getFractionAsString() -> String {
        
        // If denominator is value than discarding it's value.
        if intDenominator == 1 {
            return "\(intNumerator)"
        }
        
        // Else calculating quotient, remainder and returning the desired fraction value.
        let quotient = intNumerator/intDenominator
        if quotient == 0 {
            return "\(intNumerator)/\(intDenominator)"
        }
        
        let remainder = intNumerator % intDenominator
        let fraction = "\(quotient)&\(remainder)/\(intDenominator)"
        return fraction
    }
}

extension FractionNumber {
    
    // MARK: - Struct operator methods
    
    // This function is adding those fractions.
    static func add(leftSide: FractionNumber,
                   rightSide: FractionNumber) -> FractionNumber {
        
        /*
         --> The normal adding function for fractions. Where numbers are crossed multiplied before addition is performed and result is stored in numerator.
         --> Numbers in denominator are just multiplied.
         */
        let intNumerator = (leftSide.intNumerator * rightSide.intDenominator) + (rightSide.intNumerator * leftSide.intDenominator)
        let intDemoninator = leftSide.intDenominator * rightSide.intDenominator
        
        return FractionNumber(numerator: intNumerator,
                              denominator: intDemoninator)
    }
    
    // This function is subtracting those fractions.
    static func subtract(leftSide: FractionNumber,
                   rightSide: FractionNumber) -> FractionNumber {
        
        /*
         --> The normal subtracting function for fractions. Where numbers are crossed multiplied before subtration is performed and result is stored in numerator.
         --> Numbers in denominator are just multiplied.
         */
        let intNumerator = (leftSide.intNumerator * rightSide.intDenominator) - (rightSide.intNumerator * leftSide.intDenominator)
        let intDemoninator = leftSide.intDenominator * rightSide.intDenominator
        
        return FractionNumber(numerator: intNumerator,
                              denominator: intDemoninator)
    }
    
    // This function is multiplaying those fractions.
    static func multiply(leftSide: FractionNumber,
                   rightSide: FractionNumber) -> FractionNumber {
        
        /*
         --> The normal multiplying function for fractions. Numerators are just multiplied.
         --> Numbers in denominator are just multiplied.
         */
        let intNumerator = leftSide.intNumerator * rightSide.intNumerator
        let intDemoninator = leftSide.intDenominator * rightSide.intDenominator
        
        return FractionNumber(numerator: intNumerator,
                              denominator: intDemoninator)
    }
    
    // This function is dividing those fractions.
    static func divide(leftSide: FractionNumber,
                   rightSide: FractionNumber) -> FractionNumber {
        
        /*
         --> The normal divide function for fractions. Numerator of one is multiplied with denominator of other.
         */
        let intNumerator = leftSide.intNumerator * rightSide.intDenominator
        let intDemoninator = leftSide.intDenominator * rightSide.intNumerator
        
        return FractionNumber(numerator: intNumerator,
                              denominator: intDemoninator)
    }
}
