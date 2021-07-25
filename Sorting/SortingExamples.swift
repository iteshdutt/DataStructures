import UIKit

let numbers = [99, 44, 6, 2, 1, 5, 63, 87, 283, 4, 0];


//func quickSort(_ array: [Int],_ left: Int,_ right: Int) -> [Int] {
//
//    var quickSortArray = numbers
//
//    if left < right {
//
//        let length = array.count;
//        var pivot = right;
//        var partitionIndex: Int;
//
//        partitionIndex = partition(array, pivot, left, right);
//
//        let _ =  quickSort(quickSortArray, left, partitionIndex - 1);
//        let _ =   quickSort(quickSortArray, partitionIndex + 1, right);
//    }
//    return quickSortArray;
//
//}


//Select first and last index as 2nd and 3rd parameters

print("Quick sort \(quickSort(numbers, 0, numbers.count - 1))");


// Tree structure
func mergeSort (_ array: [Int]) -> [Int] {
    if (array.count == 1) {
        return array
    }
    // Split Array in into right and left
    let middle = array.count/2
    let left = Array(array[..<middle])// ?? [Int]()
    let right = Array(array[middle...])// ?? [Int]()
    return merge(
        mergeSort(left),
        mergeSort(right)
    )
}

func merge(_ left: [Int],_ right: [Int]) -> [Int] {
    var result: [Int] = [Int]()
    var leftArray = left
    var rightArray = right
    while leftArray.count > 0 || rightArray.count > 0 {
        if leftArray.count > 0 && rightArray.count > 0 {
            if rightArray[0] > leftArray[0] {
                result.append(leftArray[0])
                leftArray.remove(at: 0)
            } else {
                result.append(rightArray[0])
                rightArray.remove(at: 0)
            }
        } else if leftArray.count > 0 {
            result.append(contentsOf: leftArray)
            leftArray.removeAll()
        } else if rightArray.count > 0 {
            result.append(contentsOf: rightArray)
            rightArray.removeAll()
        }
    }
    return result
}


let answer = mergeSort(numbers);
print("Merge sort array \(answer)");
/*
 *******************************************************
 *******************************************************
 *******************************************************
 *******************************************************
 *******************************************************
 *******************************************************
 
 */
func insertionSort(_ numbers: [Int]) -> [Int] {
    var insertionSortArray: [Int] = numbers
    for i in 1..<numbers.count {
        
        let currentValue = numbers[i]
        if currentValue < insertionSortArray[0] {
            insertionSortArray.remove(at: i)
            insertionSortArray.insert(currentValue, at: 0)
        } else {
            for index in 0..<i {
                if insertionSortArray[index]<currentValue && insertionSortArray[index+1]>currentValue {
                    insertionSortArray.remove(at: i)
                    insertionSortArray.insert(currentValue, at: index+1)
                }
            }
        }
        
    }
    return insertionSortArray
}
print("Insertion sort \(insertionSort(numbers))");
/*
 *******************************************************
 *******************************************************
 *******************************************************
 *******************************************************
 *******************************************************
 *******************************************************
 
 */

func selectionSort(_ numbers: [Int]) -> [Int] {
    var selectionSortArray: [Int] = numbers
    for i in 0..<selectionSortArray.count {
        var index = i
        for j in i+1..<selectionSortArray.count {
            if selectionSortArray[index] > selectionSortArray[j] {
                index = j
            }
        }
        let previousValue = selectionSortArray[i]
        let newValue = selectionSortArray[index]
        selectionSortArray[i] = newValue
        selectionSortArray[index] = previousValue
    }
    return selectionSortArray
}

print("selectionSort \(selectionSort(numbers))");

/*
 *******************************************************
 *******************************************************
 *******************************************************
 *******************************************************
 *******************************************************
 *******************************************************
 
 */
func bubbleSort(_ numbers: [Int]) -> [Int] {
    var bubbleSortArray: [Int] = numbers
    for _ in 0..<bubbleSortArray.count {
        for j in 0..<bubbleSortArray.count {
            if bubbleSortArray.count > j+1 {
                if bubbleSortArray[j] > bubbleSortArray[j+1] {
                    let valueAtNextIndex = bubbleSortArray[j+1]
                    let valueAtCurrrnetIndex = bubbleSortArray[j]
                    bubbleSortArray[j] = valueAtNextIndex
                    bubbleSortArray[j+1] = valueAtCurrrnetIndex
                }
            }
        }
    }
    return bubbleSortArray
}
print("bubbleSort \(bubbleSort(numbers))");
/*
 *******************************************************
 *******************************************************
 *******************************************************
 *******************************************************
 *******************************************************
 *******************************************************
 
 */
