import UIKit

func findFactorialRecursive(_ number: Int) -> Int {
    if number<3 {
        return number
    }
    return number * findFactorialRecursive(number-1)
}

func findFactorialIterative(_ number: Int) -> Int {
    var factorialValue = 1;
    if number<3 {
        return number
    }
    for index in 2...number {
        factorialValue *= index;
    }
    return factorialValue;
}

print("Factorial value \(findFactorialRecursive(5))")

print("Factorial findFactorialIterative \(findFactorialIterative(5))")


func fibonacciIterativeIndexForSelectedValue(_ number: Int) -> Int {
    var listNumbers = [0,1]
    while listNumbers.last != number {
        let value = listNumbers.last!+listNumbers[listNumbers.count-2]
        listNumbers.append(value)
    }
    return listNumbers.count-1
}
print("fibonacciRecursive \(fibonacciIterativeIndexForSelectedValue(21))")

func fibonacciRecursiveForSelectedIndex(_ index: Int) -> Int {
    if index < 2 {
        return index
    }
    return fibonacciRecursiveForSelectedIndex(index-1) + fibonacciRecursiveForSelectedIndex(index-2)
}
print("fibonacciRecursive  \(fibonacciRecursiveForSelectedIndex(8))")

//
//func reverseString(str: String) -> String {
//    print("Reverse string called")
//    let lowerBound = String.Index(encodedOffset: 0)
//    let upperBound = String.Index(encodedOffset: 1)
//    return reverseString(str: String(str[lowerBound..<upperBound])) + String(str[lowerBound..<upperBound])
//}
//print("Revrese \(reverseString(str: "HelloWorld"))")
//
