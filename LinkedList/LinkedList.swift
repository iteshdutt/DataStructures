class Node<T> {
  var value: T
  var next: Node<T>?
  var previous: Node<T>?

  init(value: T) {
    self.value = value
  }
}

class LinkedList<T> {

  private var head: Node<T>?
  private var tail: Node<T>?
  var length: Int = 0
  var isEmpty: Bool {
    return head == nil
  }
  var first: Node<T>? {
    return head
  }
  var last: Node<T>? {
    return tail
  }

  func append(_ value: T) {
    let newNode = Node(value: value)
    if let tailNode = tail {
      newNode.previous = tailNode
      tailNode.next = newNode
    } else {
      head = newNode
    }
    tail = newNode
    length += 1
  }

  func prepend(_ value: T) {
    let newNode = Node(value: value)
    let oldHead = head
    head = newNode
    head?.next = oldHead
    oldHead?.previous = head
    length += 1
  }

  func printList() {
    var array: [T] = [T]()
    var currentNode = self.head
    while currentNode != nil {
      if let value = currentNode?.value {
        array.append(value)
      }
      currentNode = currentNode?.next
    }
    print("array \(array)")
  }

  func insert(_ index: Int,_ value: T) {
    if index >= length {
      self.append(value)
      printList()
      return
    }
    var leader = traverseToIndex(index-1)
    var holdingNode = leader?.next
    print("leader value \(leader?.value)")
    let newNode = Node(value: value)
    newNode.previous = leader
    leader?.next = newNode
    holdingNode?.previous = newNode
    newNode.next = holdingNode
    length += 1
    // printList()
  }

  func remove(_ index: Int) {
    if index >= length || index < 0 {
      return
    }
    var leader = traverseToIndex(index-1)
    var nodeToBeRemoved = leader?.next
    leader?.next = nodeToBeRemoved?.next
    length -= 1
    printList()
  }

  private func traverseToIndex(_ index: Int) -> Node<T>?{
    var currentIndex = 0
    var currentNode = self.head
    while currentIndex != index {
      currentNode = currentNode?.next
      currentIndex += 1
    }
    return currentNode
  }

  // Using single linked list
  func reverse() {
    if !self.head.next {
      return
    }
    var firstNode = self.head
    var secondNode = self.head.next
    while secondNode != nil {
      var temp = secondNode.next
      secondNode.next = firstNode
      firstNode = secondNode
      secondNode = temp
    }
    self.head.next = nil
    self.head = first
  }
}

let linkedList = LinkedList<Int>()
linkedList.append(5)
linkedList.append(15)
linkedList.append(25)
linkedList.prepend(1)
linkedList.insert(2, 99)
// linkedList.remove(3)

// print(linkedList.first?.value)
print(linkedList.first?.next?.value)
print(linkedList.first?.next?.next?.value)
print(linkedList.first?.next?.next?.next?.value)
// print(linkedList.last?.value)
print("------------")
print(linkedList.first?.next?.next?.next?.next?.next?.previous?.value)
print(linkedList.first?.next?.next?.next?.next?.previous?.value)

print(linkedList.first?.next?.next?.next?.next?.previous?.value)
print(linkedList.first?.next?.next?.next?.previous?.value)
print(linkedList.first?.next?.next?.previous?.value)
print(linkedList.first?.next?.previous?.value)
print("------------")
print(linkedList.printList())



