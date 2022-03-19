// MARK: - 11724번(BFS)
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, M) = (input[0], input[1])
var adj = Array(repeating: Array(repeating: false, count: N + 1), count: N + 1)
var check = Array(repeating: false, count: N + 1) // 방문 체크
var answer: Int = 0

for _ in 0..<M {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (u, v) = (input[0], input[1])
    adj[u][v] = true
    adj[v][u] = true
}

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

func bfs(_ startIndex: Int) {
    var q = Dequeue([startIndex])
    
    while !q.isEmpty {
        let now = q.popFirst()
        for next in 1...N {
            if (adj[now][next] == true) && (check[next] == false) { // 연결되어 있고, 방문한 적 없으면,
                check[next] = true
                q.pushLast(next)
            }
        }
    }
    
}

for i in 1...N {
    if check[i] == false {
        check[i] = true
        answer += 1
        bfs(i)
    }
}

print(answer)
