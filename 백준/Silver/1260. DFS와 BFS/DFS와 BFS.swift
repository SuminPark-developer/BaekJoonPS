// MARK: - 1260번
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, M, V) = (input[0], input[1], input[2])

var board: [[Int]] = Array(repeating: Array(repeating: 0, count: N + 1), count: N + 1)
var visited = Array(repeating: false, count: N + 1)

for _ in 0..<M {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (y, x) = (input[0], input[1])
    board[y][x] = 1
    board[x][y] = 1
}

var dfsAnswer: [Int] = []
func dfs(_ index: Int) { // 재귀
    visited[index] = true
    dfsAnswer.append(index)
    
    for next in 1...N {
        if board[index][next] == 1 && visited[next] == false { // 연결 되어 있고, 미방문 상태 이면
            dfs(next)
        }
    }
}

dfs(V)
print(dfsAnswer.map{String($0)}.joined(separator: " "))


class Deque<T> {
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
    
    func pushFirst(_ element: T) {
        deQueue.append(element)
    }
    
    func pushLast(_ element: T) {
        enQueue.append(element)
    }
    
    func popFirst() -> T {
        if deQueue.isEmpty {
            deQueue = enQueue.reversed()
            enQueue.removeAll()
        }
        return deQueue.popLast()!
    }
    
    func popLast() -> T {
        if enQueue.isEmpty {
            enQueue = deQueue.reversed()
            deQueue.removeAll()
        }
        return enQueue.popLast()!
    }
}


visited = Array(repeating: false, count: N + 1)
var myDeque = Deque([V])
var answerBfs: [Int] = []

func bfs(_ index: Int) { // 덱
    visited[index] = true
    
    while !myDeque.isEmpty {
        let currentY = myDeque.popFirst()
        answerBfs.append(currentY)
        
        for next in 1...N {
            if board[currentY][next] == 1 && visited[next] == false { // 연결되어 있고, 미방문상태이면
                myDeque.pushLast(next)
                visited[next] = true
            }
        }
    }
}

bfs(V)
print(answerBfs.map{String($0)}.joined(separator: " "))
