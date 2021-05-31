import UIKit


class Node<T> {
    var value: T
    var next: Node<T>?
    init(value: T) {
        self.value = value
    }
    
}

struct StackLinkedList<T> {
    var top: Node<T>?
    var bottom: Node<T>?
    var length: Int = 0

    func peek() -> Node<T>? {
        return self.top
    }
    
    mutating func pop() {
        if let topNode = self.top {
            self.top = self.top?.next
            if self.top == nil {
                self.bottom = nil
            }
            length = length-1
        }

    }
    
    mutating func push(value: T) {
        let node = Node(value: value)
        if length == 0 {
            self.top = node
            self.bottom = node
        } else {
            let holdingPointer = self.top
            self.top = node;
            self.top?.next = holdingPointer
        }
        length = length+1
    }
    
}

var myStackLinkedList = StackLinkedList<String>()
print("peek \(myStackLinkedList.peek())")
myStackLinkedList.push(value: "Google")
myStackLinkedList.push(value: "Udemy")
myStackLinkedList.push(value: "Discord")

print("Stack Top Value \(myStackLinkedList.top?.value)")
print("Stack Top Next Value \(myStackLinkedList.top?.next?.value)")
myStackLinkedList.pop()
myStackLinkedList.pop()
print("Stack Bottom Value \(myStackLinkedList.bottom?.value)")
myStackLinkedList.pop()
print("Stack Bottom Value1 \(myStackLinkedList.bottom?.value)")



struct StackArray<T> {
    var array: [T]? = []
   

    func peek() -> T? {
        return self.array?.last
    }
    
    mutating func pop() {
        if !(self.array?.isEmpty ?? false) {
            self.array?.removeLast()
        }

    }
    
    mutating func push(value: T) {
        self.array?.append(value)
    }
    
}

var myStackArray = StackArray<String>()
print("myStackArray \(myStackArray.peek())")
myStackArray.push(value: "Google")
myStackArray.push(value: "Udemy")
myStackArray.push(value: "Discord")

print("Stack Top Value \(myStackArray.array?.last)")
myStackArray.pop()
myStackArray.pop()
print("Stack Bottom Value \(myStackArray.array?.last)")
myStackArray.pop()
print("Stack Bottom Value1 \(myStackArray.array?.last)")


// Discord
// Udemy
// Google
