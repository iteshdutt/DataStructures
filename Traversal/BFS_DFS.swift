import UIKit
//Binary search tree

class Node<Int> {
    var value: Int
    var right: Node<Int>?
    var left: Node<Int>?
    
    init(value: Int) {
        self.value = value
    }
    
    func copy(with zone: NSZone? = nil) -> Node<Int> {
        let nodeCopy = Node(value: value)
        nodeCopy.left = left
        nodeCopy.right = left
        
        return nodeCopy
    }
}

class BinarySearchTree {
    
    var root: Node<Int>?
    
    func insert(_ value: Int) {
        if (root == nil) {
            root = Node(value: value)
        } else {
            self.addValue(value, node: root)
        }
    }
    
    private func addValue(_ value: Int, node: Node<Int>?) {
        let newNode = Node(value: value)
        if let nodeValue = node?.value {
            if nodeValue > value {
                if let leftNode = node?.left {
                    self.addValue(value, node: leftNode)
                } else {
                    node?.left = newNode
                    
                }
            } else {
                if let rightNode = node?.right {
                    self.addValue(value, node: rightNode)
                } else {
                    node?.right = newNode
                }
            }
        } else {
            print("Else condition")
        }
    }
    
    
    func breadthForSearch() -> [Int] {
        guard var currentNode = self.root else {
            return []
        }
        var list = [Int]()
        var queue = [Node<Int>]()
        queue.append(currentNode)
        while queue.count > 0 {
            currentNode = queue.removeFirst()
            print("Current node value \(currentNode.value)")
            list.append(currentNode.value)
            if let leftNode = currentNode.left {
                queue.append(leftNode)
            }
            if let rightNode = currentNode.right {
                queue.append(rightNode)
            }
        }
        print("Final breadth search list \(list)")
        return list
    }
    
    
    func breadthForSearchRecursive(queue: [Node<Int>], list: [Int]) -> [Int] {
        if queue.isEmpty  {
            print("Final breadthForSearchRecursive list \(list)")
            return list
        }
        var currentQueue = queue
        var updatedList = list
        let currentNode = currentQueue.removeFirst()
        updatedList.append(currentNode.value)
        if let leftNode = currentNode.left {
            currentQueue.append(leftNode)
        }
        if let rightNode = currentNode.right {
            currentQueue.append(rightNode)
        }
        return breadthForSearchRecursive(queue: currentQueue, list: updatedList)
        
    }
    
    func dFSInOrder() -> [Int] {
        var array  = [Int]()
        return traverseInOrder(self.root!, &array)
    }
    
    func dFSPreOrder() -> [Int] {
        var array  = [Int]()
        return traversePreOrder(self.root!, &array)
    }
    func dFSPostOrder() -> [Int] {
        var array  = [Int]()
        return traversePostOrder(self.root!, &array)
    }
    
    private func traverseInOrder(_ node: Node<Int>,_ list: inout [Int]) -> [Int] {
        if let leftNode = node.left {
            traverseInOrder(leftNode, &list)
        }
        list.append(node.value)
        if let rightNode = node.right{
            traverseInOrder(rightNode, &list)
        }
        return list
    }
    
    private func traversePreOrder(_ node: Node<Int>,_ list: inout [Int]) -> [Int] {
        list.append(node.value)
        if let leftNode = node.left {
            traversePreOrder(leftNode, &list)
        }
        if let rightNode = node.right{
            traversePreOrder(rightNode, &list)
        }
        return list
    }
    
    
    private func traversePostOrder(_ node: Node<Int>,_ list: inout [Int]) -> [Int] {
        
        if let leftNode = node.left {
            traversePostOrder(leftNode, &list)
        }
        if let rightNode = node.right{
            traversePostOrder(rightNode, &list)
        }
        list.append(node.value)
        return list
    }
}

var binarySearchTree = BinarySearchTree()
print("*****************")
binarySearchTree = BinarySearchTree()
binarySearchTree.insert(9)
binarySearchTree.insert(4)
binarySearchTree.insert(20)
binarySearchTree.insert(1)
binarySearchTree.insert(6)
binarySearchTree.insert(15)
binarySearchTree.insert(170)
binarySearchTree.breadthForSearch()
binarySearchTree.breadthForSearchRecursive(queue: [binarySearchTree.root!], list: [Int]())
print("*****************")

print("binarySearchTree.dFSInOrder() \(binarySearchTree.dFSInOrder())")
print("binarySearchTree.dFSPreOrder() \(binarySearchTree.dFSPreOrder())")
print("binarySearchTree.dFSPostOrder() \(binarySearchTree.dFSPostOrder())")


//          9
//  4               20
//1     6       15      170

// BFS [9,4,20, 1, 6, 15, 170]
//DFS  [9, 4,1, 6, 20, 15, 170]
