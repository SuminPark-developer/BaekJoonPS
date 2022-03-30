// MARK: - 1697번(BFS)
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
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, K) = (input[0], input[1])
var board = Array(repeating: 0, count: 100001) // 0부터 100000까지.
var visited = Array(repeating: -1, count: 100001) // 0부터 100000까지.

func isValidCoord(_ x: Int) -> Bool {
    return (0 <= x && x <= 100000)
}

func isEscape(_ x: Int) -> Bool { // 수빈이를 만나면 탈출.
    return (x == K)
}

func bfs(_ startX: Int) -> Int {
    let q = Dequeue([startX])
    visited[startX] = 0 // 첫 위치 0으로 초기화.
    
    while !q.isEmpty {
        let x = q.popFirst()
        
        if isEscape(x) { // 탈출 성공 시,
            return visited[x]
        }
        
        if isValidCoord(x + 1) && board[x + 1] == 0 && visited[x + 1] == -1 { // x+1한게 유효한 범위고, x+1이 갈 수 있는 곳이고, 미방문한 곳이면,
            visited[x+1] = visited[x] + 1
            q.pushLast(x+1)
        }
        if isValidCoord(x - 1) && board[x - 1] == 0 && visited[x - 1] == -1 { // x-1한게 유효한 범위고, x-1이 갈 수 있는 곳이고, 미방문한 곳이면,
            visited[x-1] = visited[x] + 1
            q.pushLast(x-1)
        }
        if isValidCoord(2 * x) && board[2 * x] == 0 && visited[2 * x] == -1 { // 2*x한게 유효한 범위고, 2*x이 갈 수 있는 곳이고, 미방문한 곳이면,
            visited[2*x] = visited[x] + 1
            q.pushLast(2*x)
        }
    }
    return -1
}

let answer = bfs(N)
print(answer)
