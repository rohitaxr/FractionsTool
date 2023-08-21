//
//  File.swift
//  
//
// 
//

import Foundation

// All the messages are written in this enum.
enum Messages: String {
    case strMainMessage = "Follow the instructions given below and enter any fraction numbers and operator to calculate the result.\n"
    case strStep1 = "--> Operands and operators shall be separated by one or more spaces.\n"
    case strStep2 = "--> Mixed numbers shall be represented by whole&numerator/denominator; for example, “3&1/4“, “-1&7/8”.\n"
    case strStep3 = "--> Improper fractions, whole numbers, and negative numbers are allowed as operands.\n"
    case strStep4 = "--> Legal operators shall be *,  /,  +,  - (multiply, divide, add, subtract).\n"
    case strSubMessage = "Enter the fraction operation below or type 'exit' to quit program:\n"
    case strInvalidParameters = "Invalid input parameters. Please read the instructions above and provide the parameter again.\n\n"
    case strResultMessage = "Great. Result for the program is:"
    case strSomethingWentWrong = "Something went wrong. Please try again.\n\n"
    case strExitMessage = "Exiting the program. Have a good day ahead. See you soon. :)"
    case strTestCaseErrorMessage = "Oops! result didn't matched."
    case strTestCaseInvalidParameter = "Uh-oh. The parameter entered by you is not correct."
}

extension String {
    
    // MARK: - String extension method
    
    // This function reduces extra spaces from program and keep just one space between operators and operands.
    func condenseWhitespace() -> String {
        
        let components = self.components(separatedBy: CharacterSet.whitespacesAndNewlines)
        return components.filter { !$0.isEmpty }.joined(separator: " ")
    }
}
