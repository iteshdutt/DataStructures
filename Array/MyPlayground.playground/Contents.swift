import UIKit

var str = "Hello, playground"
func reverseString(_ str: String) {
  print("Function called")
  let array = Array(str)
  // print(array)
  var reversedArray: Array = [String]()
  for item in array.reversed() {
    reversedArray.append(String(item))
  }
  let string =  reversedArray.joined()
    print(string)

}

reverseString( "itesh")
