import UIKit


class Node<T> {
    var value: T
    var next: Node<T>?
    init(value: T) {
        self.value = value
    }
    
}

struct QueueLinkedList<T> {
    var first: Node<T>?
    var last: Node<T>?
    var length: Int = 0

    func peek() -> Node<T>? {
        return self.first
    }
    
    mutating func dequeue() {
        if let firstPointer = self.first {
            let holdingPointer = firstPointer.next
            self.first = holdingPointer
            if firstPointer.next == nil {
                self.last = nil
            }
            length = length-1
        } else {
            self.first = nil
            self.last = nil
            length = 0
        }
    }
    
    mutating func enqueue(value: T) {
        let node = Node(value: value)
        if self.first == nil {
            self.first = node
            self.last = node
        } else {
            self.last?.next = node
            self.last = node
        }
        length = length+1
    }
    
}

var myQueueLinkedList = QueueLinkedList<String>()
print("peek \(myQueueLinkedList.peek())")
myQueueLinkedList.enqueue(value: "Joy")
print("Queue first Value \(myQueueLinkedList.first?.value)")
print("Queue last Value \(myQueueLinkedList.last?.value)")

myQueueLinkedList.enqueue(value: "Matt")
print("Queue first Value \(myQueueLinkedList.first?.value)")
print("Queue last Value \(myQueueLinkedList.last?.value)")

myQueueLinkedList.enqueue(value: "Pavel")
print("Queue first Value \(myQueueLinkedList.first?.value)")
print("Queue last Value \(myQueueLinkedList.last?.value)")

myQueueLinkedList.enqueue(value: "Samir")
print("Queue first Value \(myQueueLinkedList.first?.value)")
print("Queue last Value \(myQueueLinkedList.last?.value)")

//print("Stack Top Value \(myQueueLinkedList.top?.value)")
//print("Stack Top Next Value \(myQueueLinkedList.top?.next?.value)")
print("--------------")

myQueueLinkedList.dequeue()
print("Queue first Value \(myQueueLinkedList.first?.value)")
print("Queue last Value \(myQueueLinkedList.last?.value)")

myQueueLinkedList.dequeue()
print("Queue first Value \(myQueueLinkedList.first?.value)")
print("Queue last Value \(myQueueLinkedList.last?.value)")

myQueueLinkedList.dequeue()
print("Queue first Value \(myQueueLinkedList.first?.value)")
print("Queue last Value \(myQueueLinkedList.last?.value)")

myQueueLinkedList.dequeue()
print("Queue first Value \(myQueueLinkedList.first?.value)")
print("Queue last Value \(myQueueLinkedList.last?.value)")

