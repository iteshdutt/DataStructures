import UIKit

// Edge list
let graph = [[0,2],[3,2],[1,2],[1,3]]

// Adjacent list
let graph1 = [[2],[3,2],[1,0,3],[1,2]]


// Adjacent Matrix in the binary which represent that it is connected to other nodes like 0,1,2,3 in our case
let graph2 = [
    [0,0,1,0],
    [0,0,1,1],
    [1,1,0,1],
    [0,1,1,0]
]



class Graph {
    
    
    var numberOfNodes = 0
    var adjacentList: [Int: [Int]] = [Int: [Int]]()
    
    func addVertex(node: Int) {
        if let node = adjacentList[node] {
            return
        }
        adjacentList[node] = []
        print("adjacentList \(adjacentList)")
    }
    
    func addEdge(node1: Int, node2: Int) {
        var node1Connections = adjacentList[node1]
        if !(node1Connections?.contains(node2) ?? false) {
            node1Connections?.append(node2)
            adjacentList[node1] = node1Connections
        }
        
        var node2Connections = adjacentList[node2]
        if !(node2Connections?.contains(node1) ?? false) {
            node2Connections?.append(node1)
            adjacentList[node2] = node2Connections
        }
    }
    
    private func showConnections() {
        
    }
//
//    static func == (lhs: Graph<T>, rhs: Graph<T>) -> Bool {
//        return true;
//    }
}

let myGraph = Graph()
myGraph.addVertex(node: 0)
myGraph.addVertex(node: 1)
myGraph.addVertex(node: 2)
myGraph.addVertex(node: 3)
myGraph.addVertex(node: 4)
myGraph.addVertex(node: 5)
myGraph.addVertex(node: 6)

myGraph.addEdge(node1: 3, node2: 1)
myGraph.addEdge(node1: 3, node2: 4)
myGraph.addEdge(node1: 4, node2: 2)
myGraph.addEdge(node1: 4, node2: 5)
myGraph.addEdge(node1: 1, node2: 2)
myGraph.addEdge(node1: 0, node2: 1)
myGraph.addEdge(node1: 0, node2: 2)
myGraph.addEdge(node1: 6, node2: 5)

print("Final list \(myGraph.adjacentList)")

