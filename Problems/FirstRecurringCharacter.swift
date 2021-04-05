//Google Question
//Given an array = [2,5,1,2,3,5,1,2,4]:
//It should return 2

//Given an array = [2,1,1,2,3,5,1,2,4]:
//It should return 1

//Given an array = [2,3,4,5]:
//It should return undefined


func firstRecurringCharacter(_ input: [Int]) -> Int? {
  var firstRecurringCharacter: Int? = nil
  var characters: [Int: Int] = [Int: Int]()
  for i in stride(from: 0, to: input.count, by: 1) {
    let selectedValue = input[i]
    if characters[selectedValue] != nil {
      return selectedValue
    }
    characters[selectedValue] = selectedValue
  }
  return firstRecurringCharacter
}

print(firstRecurringCharacter([2,3,4,5]) ?? -1)


//Bonus... What if we had this:
// [2,5,5,2,3,5,1,2,4]
// return 5 because the pairs are before 2,2
