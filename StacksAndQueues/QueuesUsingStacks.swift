import UIKit

struct QueueUsingStacks<T> {
    var stack: [T]? = []

    func peek() -> T? {
        return self.stack?.last
    }
    
    mutating func pop() -> T? {
        if !(self.stack?.isEmpty ?? true) {
            return self.stack?.removeLast()
        }
        return nil
    }
    
    mutating func push(value: T) {
        if isEmpty() {
            self.stack?.append(value)
            return
        }
        var tempStack: [T] = []
        while !isEmpty() {
            if let lastElement = pop() {
                tempStack.append(lastElement)
            }
        }
        self.stack?.append(value)
        while !tempStack.isEmpty {
            self.stack?.append(tempStack.removeLast())
        }
    }
    
    func isEmpty() -> Bool {
        return stack?.isEmpty ?? true
    }
    
}

var myQueueLinkedList = QueueUsingStacks<String>()

myQueueLinkedList.push(value: "Joy")
print("Queue Joy \(myQueueLinkedList.stack)")

myQueueLinkedList.push(value: "Matt")
print("Queue Matt \(myQueueLinkedList.stack)")

myQueueLinkedList.push(value: "Pavel")
print("Queue stack \(myQueueLinkedList.stack)")

myQueueLinkedList.push(value: "Samir")
print("Queue Samir \(myQueueLinkedList.stack)")
print("--------------")

myQueueLinkedList.pop()
print("Queue \(myQueueLinkedList.stack)")

myQueueLinkedList.pop()
print("Queue \(myQueueLinkedList.stack)")

myQueueLinkedList.pop()
print("Queue \(myQueueLinkedList.stack)")

myQueueLinkedList.pop()
print("Queue \(myQueueLinkedList.stack)")

myQueueLinkedList.pop()
print("Queue \(myQueueLinkedList.stack)")
