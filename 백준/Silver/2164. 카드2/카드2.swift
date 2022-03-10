// 백준 - 2164번(두 개의 배열 사용 - 빠름)
class Queue {
    var enQueue: [Int]
    var deQueue: [Int] = []
    
    var isEmpty: Bool {
        return enQueue.isEmpty && deQueue.isEmpty
    }
    
    var count: Int {
        return enQueue.count + deQueue.count
    }
    
    init(_ queue: [Int]) {
        self.enQueue = queue
    }
    
    func push(_ element: Int) {
        enQueue.append(element)
    }
    
    func pop() -> Int {
        if deQueue.isEmpty {
            deQueue = enQueue.reversed()
            enQueue.removeAll()
        }
        return deQueue.popLast()!
    }
}

let N = Int(readLine()!)!
var temp = [Int]()
for i in 1...N {
    temp.append(i)
}
var myQueue: Queue = Queue(temp)

while myQueue.count > 1 {
    myQueue.pop()
    myQueue.push(myQueue.pop())
}

print(myQueue.pop())