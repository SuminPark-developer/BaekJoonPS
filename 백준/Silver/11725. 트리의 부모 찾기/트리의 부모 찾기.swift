// MARK: - 11725번(참고 : https://t.ly/T01a)
class Dequeue<T> {
    var enQueue: [T]
    var deQueue: [T] = []
    
    var count: Int {
        return enQueue.count + deQueue.count
    }
    
    var isEmpty: Bool {
        return enQueue.isEmpty && deQueue.isEmpty
    }
    
    init(_ queue: [T]) {
        enQueue = queue
    }
    
    func pushLast(_ element: T) {
        enQueue.append(element)
    }
    
    func pushFirst(_ element: T) {
        deQueue.append(element)
    }
    
    func popLast() -> T {
        if enQueue.isEmpty {
            enQueue = deQueue.reversed()
            deQueue.removeAll()
        }
        return enQueue.popLast()!
    }
    
    func popFirst() -> T {
        if deQueue.isEmpty {
            deQueue = enQueue.reversed()
            enQueue.removeAll()
        }
        return deQueue.popLast()!
    }
}


let N = Int(readLine()!)!
var adj: [[Int]] = Array(repeating: [], count: N + 1) // 인접리스트

for _ in 0..<N-1 {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (a, b) = (input[0], input[1])
    
    adj[a].append(b)
    adj[b].append(a)
}

var parents = Array(repeating: -1, count: N + 1) // -1이면 미방문.
var myDeq: Dequeue<Int> = Dequeue([1])


while !myDeq.isEmpty {
    let index = myDeq.popFirst()
    
    for next in adj[index] {
        if parents[next] == -1 {
            parents[next] = index
            myDeq.pushLast(next)
        }
    }
}

for parent in parents[2...] {
    print(parent)
}
