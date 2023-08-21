import Foundation

// MARK: - Main function

func main() {
    
    // As soon as main is called we are taking input from user and validating it.
    takeUserInputAndValidate()
}

// MARK: - Custom functions

// Adding static true condition so that out program continues to run for indefinite time until user manually types exit.

func takeUserInputAndValidate() {
    
    while true {
        
        // Function to take input from user.
        showInputMessageToUser()
        
        // Checking if input is empty or not.
        guard let strInput = readLine()?.condenseWhitespace(),
              !strInput.isEmpty else {
            continue
        }
        
        // If user typed exit than we are breaking loop expiring the session.
        if strInput.lowercased() == "exit" {
            exitFromProgram()
            break
        }
        
        let arrComponent = strInput.components(separatedBy: " ")
        
        if arrComponent.count != 3 { // If array count is not coming to 2 than user has not entered correct input. So showing error message.
            print(Messages.strInvalidParameters.rawValue)
            continue
        }
        
        let strOperator = arrComponent[1] // Operator character that which operation needs to be performed.
        
        // Getting numbers from array and converting them to normal numerator and denominator. If any of the input is not correct than showing error message to user.
        guard let number1 = getNumberInNumeratorDenominator(strNumber: arrComponent[0]),
              let number2 = getNumberInNumeratorDenominator(strNumber: arrComponent[2])
        else {
                  print(Messages.strInvalidParameters.rawValue)
                  continue
             }
        
        // Calling this function to get the result.
        getResult(number1: number1,
                  number2: number2,
                  strOperator: strOperator)
    }
}

// This function is taking input from user.
func showInputMessageToUser() {
    
    // Message to show to user while taking input from command line.
    let strMessageToShow = Messages.strMainMessage.rawValue + Messages.strStep1.rawValue + Messages.strStep2.rawValue + Messages.strStep3.rawValue + Messages.strStep4.rawValue + Messages.strSubMessage.rawValue
    
    print(strMessageToShow, terminator: "? ") // Terminator appends the provided string to the message.
}

// This function is showing the exit message to user.
func exitFromProgram() {
    
    print(Messages.strExitMessage.rawValue)
}

// This function is handling the input number and separating them in accordance to their type.
func getNumberInNumeratorDenominator(strNumber: String) -> FractionNumber? {
    
    // First condition is if the number is a mixed number.
    if strNumber.contains("&") {
        return separateMixedNumber(strMixedNumber: strNumber)
    }
    
    // Second condition is if the number is a fraction.
    else if strNumber.contains("/") {
        return getFractionFromNumber(strFractionNumber: strNumber)
    }
    
    /* Last condition is if the number is a integer only. If it is than we ar forwarding number as numerator and fixed 1 as denominator.
     */
    else {
        if let intNumerator = Int(strNumber) {
            let intDenominator = 1
            return FractionNumber(numerator: intNumerator,
                                  denominator: intDenominator)
        }
    }
    
    // Else for any other case the data isn't valid and we are returning nil.
    return nil
}

/*
 - Checking for "&" sign in the number part. This "&" sign represents that the number is a mixed one.
 - After separating the outer whole number we are checking for the inner fraction(if it is valid or not by checking for "/" sign).
 - We are checking if both numerator and denominator is a valid integer or not. Also that the denominator is greater than 0.
 */
func separateMixedNumber(strMixedNumber: String) -> FractionNumber? {
    
    let arrNumbers = strMixedNumber.components(separatedBy: "&")
    
    if arrNumbers.count == 2 {
        
        let intOuterNumber = Int(arrNumbers[0]) ?? 0
        let strInnerNumber = arrNumbers[1]
        let arrInnerNumber = strInnerNumber.components(separatedBy: "/")
        
        if arrInnerNumber.count == 2 {
            
            if let intNumerator = Int(arrInnerNumber[0]),
               let intDenominator = Int(arrInnerNumber[1]),
               intDenominator != 0 {
                let intNewNumerator = (intDenominator * intOuterNumber) + intNumerator
                return FractionNumber(numerator: intNewNumerator,
                                      denominator: intDenominator)
            }
        }
    }
    
    return nil
}

// Checking for "/" sign in the number part. This "/" sign represents that the number is a fraction one.
func getFractionFromNumber(strFractionNumber: String) -> FractionNumber? {
    
    let arrInnerNumber = strFractionNumber.components(separatedBy: "/")
    
    if arrInnerNumber.count == 2 {
        
        if let intNumerator = Int(arrInnerNumber[0]),
           let intDenominator = Int(arrInnerNumber[1]),
           intDenominator != 0 {
            return FractionNumber(numerator: intNumerator,
                                  denominator: intDenominator)
        }
    }
    
    return nil
}

// This function is called to get the result from the entered parameters.
func getResult(number1: FractionNumber,
               number2: FractionNumber,
               strOperator: String) {
    
    // Performing operation on the 2 fractions entered by user and showing the result. If result is nil than showing error message.
    if var result = performOperation(leftSide: number1,
                                     rightSide: number2,
                                     strOperator: strOperator) {
        print("\(Messages.strResultMessage.rawValue) \(result.convertToFraction())\n\n")
    }
    else {
        print(Messages.strSomethingWentWrong.rawValue)
    }
}

// This function performs the required operation on the fraction numbers.
func performOperation(leftSide: FractionNumber,
                      rightSide: FractionNumber,
                      strOperator: String) -> FractionNumber? {
    
    switch strOperator {
    case "+":
        return FractionNumber.add(leftSide: leftSide, rightSide: rightSide)// leftSide + rightSide
    case "-":
        return FractionNumber.subtract(leftSide: leftSide, rightSide: rightSide)// leftSide - rightSide
    case "*":
        return FractionNumber.multiply(leftSide: leftSide, rightSide: rightSide)// leftSide * rightSide
    case "/":
        return FractionNumber.divide(leftSide: leftSide, rightSide: rightSide)// leftSide / rightSide
    default: // If user entered some other operator than returning nil.
        return nil
    }
}

// Calling main function to start executing the program.
main()
