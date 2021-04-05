class HashTable {
  var computeArray: [[Any]] = [[Any]]()
  init(_ size: Int){
    self.computeArray = Array(repeating: [0], count: size)
  }

  func hash(_ key: String) -> Int {
    var hash: Int = 0;
    for i in stride(from: 0, to: key.length, by: 1) {
      let utf16Array = Array(key.utf16)
      let asciiValue = Int(utf16Array[i])
      hash = (hash + asciiValue) % self.computeArray.count
    }
    return hash;
  }

  func set(key: String, value: Any) {
    let address = hash(key)
    var hashArray: [Any] = [Any]()
    hashArray.append(key)
    hashArray.append(value)
    let addressValue = self.computeArray[address]
    if addressValue[0] as? Int == 0 {
      self.computeArray[address] = [hashArray]
    } else {
      var array = self.computeArray[address]
      array.append(hashArray)
      self.computeArray[address] = array
    }
  }

  func get(_ key: String) -> Any?{
    let address = hash(key)
    let currentData = self.computeArray[address]
    
    if currentData[0] as? Int != 0 {
      for i in stride(from: 0, to: currentData.count, by: 1) {
        if let currentKey = currentData[i] as? [Any], let keyValue = currentKey[0] as? String, keyValue == key {
          return currentKey[1]
        }
      }
    }
    print("getHashTableObject empty")
    return nil
  }

  func keys() -> [String] {
    var keysArray: [String] = [String]()
    for i in stride(from: 0, to: self.computeArray.count, by: 1) {
      
      if let address = self.computeArray[i] as? [[Any]] {
        for j in stride(from: 0, to: address.count, by: 1) {
          let selectedArray = address[j]
          if let keyString = selectedArray[0] as? String  {
            keysArray.append(keyString)
          }
        }
      }
    }
    return keysArray
  }
}

let myHashTable = HashTable(1)
myHashTable.set(key: "grapes", value: 10000)
myHashTable.set(key: "oranges", value: 50)

myHashTable.set(key: "apple", value: 20)
let getHash = myHashTable.get("apple")
print("getHash \(getHash as Any)")
print(myHashTable.keys())
