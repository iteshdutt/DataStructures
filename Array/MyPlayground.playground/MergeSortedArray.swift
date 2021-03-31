
// func mergeSortedArrays1(_ array1: [Int],_ array2: [Int]) {

//   var sortedArray: [Int] = [Int]()
//   if !array1.length {
//     return array2
//   }

//   if !array2.length {
//     return array1
//   }
//   var i = 0
//   var j = 0

//   let array1Item = array1[0]
//   let array2Item = array2[0]
//   while array1Item || array2Item {
//     if array1Item < array2Item {
//       sortedArray.append(array1Item)
//       array1Item = array1[i]
//       i += 1
//     } else {
//       sortedArray.append(array2Item)
//       array2Item = array2[j]
//       j += 1
//     }
//   }
//   print(sortedArray)

// }


func mergeSortedArrays1(_ array1: [Int],_ array2: [Int]) {
  var sortedArray: [Int] = [Int]()
  let firstArrayTotalCount = array1.count
  let secondArrayTotalCount = array2.count
  var firstArrayCurrentCount = 0
  var secondArrayCurrentCount = 0

  for _ in 0..<firstArrayTotalCount+secondArrayTotalCount {
    var hasOneArrayFinishedIteration = false
    if firstArrayCurrentCount >= firstArrayTotalCount {

      if secondArrayTotalCount > secondArrayCurrentCount {
        let selectedElement = array2[secondArrayCurrentCount]
        if !(sortedArray.last == selectedElement) { 
          sortedArray.append(selectedElement)
        }
        secondArrayCurrentCount += 1
      }
      hasOneArrayFinishedIteration = true
    }

    if secondArrayCurrentCount >= secondArrayTotalCount {
      if firstArrayTotalCount > firstArrayCurrentCount {
        let selectedElement = array1[firstArrayCurrentCount]
        if !(sortedArray.last == selectedElement) { 
          sortedArray.append(selectedElement)
        }
        firstArrayCurrentCount += 1
      }
      hasOneArrayFinishedIteration = true
    }
    if hasOneArrayFinishedIteration {
      continue
    }

    let firstItem = array1[firstArrayCurrentCount]
    let secondItem = array2[secondArrayCurrentCount]
    if firstItem > secondItem {
      let selectedElement = secondItem
      if !(sortedArray.last == selectedElement) { 
        sortedArray.append(selectedElement)
      }
      secondArrayCurrentCount += 1
    } else {
      let selectedElement = firstItem
      if !(sortedArray.last == selectedElement) { 
        sortedArray.append(selectedElement)
      }
      firstArrayCurrentCount += 1
    }
  }
  print(sortedArray)
}


func mergeSortedArrays2(_ array1: [Int],_ array2: [Int]) -> [Int] {
  var sortedArray: [Int] = [Int]()
  // let firstArrayTotalCount = array1.count
  // let secondArrayTotalCount = array2.count
  var firstArrayIndex = 0
  var secondArrayIndex = 0
  let defaultValue = -1
  var firstItem: Int = !array1.isEmpty ? array1[firstArrayIndex] : defaultValue
  var secondItem: Int = !array2.isEmpty ? array2[secondArrayIndex] : defaultValue

  while !(firstItem == defaultValue && secondItem == defaultValue) {

    var hasArrayContainsDefaultValue = false
    if firstItem == defaultValue {
      hasArrayContainsDefaultValue = true
      if secondItem != defaultValue {
        sortedArray.append(secondItem)
        secondArrayIndex += 1
        secondItem = array2.count >  secondArrayIndex ? array2[secondArrayIndex] : defaultValue
      } else {
        return sortedArray
      }
    }

    if secondItem == defaultValue {
      hasArrayContainsDefaultValue = true
      if firstItem != defaultValue {
        sortedArray.append(firstItem)
        firstArrayIndex += 1
        firstItem = array1.count >  firstArrayIndex ? array1[firstArrayIndex] : defaultValue
      } else {
        return sortedArray
      }
    }
    if hasArrayContainsDefaultValue {
      print("returned due to empty value")
      continue
    }
    
    if firstItem < secondItem {
      sortedArray.append(firstItem)
      firstArrayIndex += 1
      firstItem = array1.count >  firstArrayIndex ? array1[firstArrayIndex] : defaultValue      
    } else {
        sortedArray.append(secondItem)
        secondArrayIndex += 1
        secondItem = array2.count >  secondArrayIndex ? array2[secondArrayIndex] : defaultValue
    }

  }
  // print(sortedArray)
  return sortedArray
}

let array = mergeSortedArrays2([0,3,4], [4,6,30, 32, 33])
print(array)
