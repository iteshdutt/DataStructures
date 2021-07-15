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
    
    func loopUp(_ value: Int) -> Node<Int>? {
        var lookUpNode: Node<Int>? = nil
        guard let rootNode = self.root, let rootNodeValue = root?.value else {
            return nil
        }
        if rootNodeValue == value {
            return rootNode
        } else {
            lookUpNode = self.lookUpNode(selectedNode: rootNode, value: value)
        }
        return lookUpNode
        
    }
    
    private func lookUpNode(selectedNode: Node<Int>?, value: Int) -> Node<Int>? {
        guard let selectedNode = selectedNode else {
            return nil
        }
        let selectedNodeValue = selectedNode.value
        if selectedNodeValue == value {
            return selectedNode
        }
        if selectedNodeValue > value {
            if let leftNode = selectedNode.left, leftNode.value == value  {
                return leftNode
            } else {
                return self.lookUpNode(selectedNode: selectedNode.left, value: value)
            }
        } else {
            if let rightNode = selectedNode.right, rightNode.value == value  {
                return rightNode
            } else {
                return self.lookUpNode(selectedNode: selectedNode.right, value: value)
            }
        }
        return nil
    }

    func remvove(_ value: Int) {
        guard var currentNode = root as? Node<Int>? else {
            return
        }
        var parentNode: Node<Int>? = nil
        while currentNode != nil {
            if let node = currentNode {
                if value < node.value {
                    parentNode = currentNode
                    currentNode = currentNode?.left
                } else if value > node.value {
                    parentNode = currentNode
                    currentNode = currentNode?.right
                } else if value == node.value {
                    // We have a match
                    if node.right == nil {
                        if parentNode == nil {
                            self.root = currentNode?.left
                        } else {
                            
                            if node.value < parentNode!.value {
                                parentNode?.left = node.left
                            } else if node.value > parentNode!.value {
                                parentNode?.right = node.left
                            }
                            
                        }
                    } else if node.right?.left == nil {
                        if parentNode == nil {
                            self.root = currentNode?.left
                        } else {
                            
                            if node.value < parentNode!.value {
                                parentNode?.left = node.left
                            } else if node.value > parentNode!.value {
                                parentNode?.right = node.left
                            }
                        }
                    } else {
                        var leftMost = currentNode?.right?.left
                        var leftMostParent = currentNode?.right
                        while leftMost?.left != nil {
                            leftMostParent = leftMost
                            leftMost = leftMost?.left
                        }
                        leftMostParent?.left = leftMost?.right
                        leftMost?.left = currentNode?.left
                        leftMost?.right = currentNode?.right
                        
                        if parentNode == nil {
                            self.root = leftMost
                            
                        } else {
                            if node.value < parentNode!.value {
                                parentNode?.left = node.left
                            } else if node.value > parentNode!.value {
                                parentNode?.right = node.left
                            }
                        }


                    }
                }
            } else {
                currentNode = nil
            }
        }
    }
}

let binarySearchTree = BinarySearchTree()
binarySearchTree.insert(9)
binarySearchTree.insert(4)
binarySearchTree.insert(20)
binarySearchTree.insert(1)
binarySearchTree.insert(6)
binarySearchTree.insert(15)
binarySearchTree.insert(170)

print("Root \(binarySearchTree.root?.value)")
print("Left \(binarySearchTree.root?.left?.value)")
print("Left \(binarySearchTree.root?.left?.left?.value)")
print("Left \(binarySearchTree.root?.left?.right?.value)")
print("--------------")

print("Right \(binarySearchTree.root?.right?.value)")
print("Right \(binarySearchTree.root?.right?.left?.value)")
print("Right \(binarySearchTree.root?.right?.right?.value)")

print("--------------")
let lookUpNode = binarySearchTree.loopUp(170)
print("Lookup --- \(lookUpNode?.left?.value)")
print("Lookup --- \(lookUpNode?.right?.value)")

print("--------------")

print(" --- \(lookUpNode?.left?.value)")
print("----Remove start----------")
let binarySearchTreeRemoval = BinarySearchTree()
binarySearchTreeRemoval.insert(12)
binarySearchTreeRemoval.insert(5)
binarySearchTreeRemoval.insert(15)
binarySearchTreeRemoval.insert(13)
binarySearchTreeRemoval.insert(14)
binarySearchTreeRemoval.insert(17)
binarySearchTreeRemoval.insert(20)
binarySearchTreeRemoval.insert(18)
binarySearchTreeRemoval.insert(3)
binarySearchTreeRemoval.insert(7)
binarySearchTreeRemoval.insert(1)
binarySearchTreeRemoval.insert(9)
binarySearchTreeRemoval.insert(8)
binarySearchTreeRemoval.insert(11)

binarySearchTreeRemoval.remove(12)

print("-------values ---------")

print("\(binarySearchTreeRemoval.root?.value)")

print("\(binarySearchTreeRemoval.root?.right?.value)")
print("\(binarySearchTreeRemoval.root?.right?.left?.value)")
print("\(binarySearchTreeRemoval.root?.right?.right?.value)")
print("\(binarySearchTreeRemoval.root?.right?.right?.left?.value)")
print("\(binarySearchTreeRemoval.root?.right?.right?.right?.value)")


print("\(binarySearchTreeRemoval.root?.right?.left?.right?.value)")
print("\(binarySearchTreeRemoval.root?.right?.left?.left?.value)")

