// MARK: - 2178번
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
let (N, M) = (input[0], input[1])
var adj: [[Int]] = []

for _ in 0..<N {
    let input = readLine()!.map{Int(String($0))!}
    adj.append(input)
}

let dy = [0, 1, 0, -1]
let dx = [1, 0, -1, 0]
var visited = Array(repeating: Array(repeating: false, count: M), count: N)

func isValid(_ y: Int, _ x: Int) -> Bool {
    return (0 <= y && y <= N - 1) && (0 <= x && x <= M - 1)
}

func bfs(_ startY: Int, _ startX: Int) -> Int {
    visited[startY][startX] = true // 시작위치 방문 포함.
    let q = Dequeue([(startY, startX, 1)])
    
    while !q.isEmpty {
        let (y, x, d) = q.popFirst()
        
        if y == N-1 && x == M-1 { // 끝에 도달했으면,
            return d
        }
        
        for k in 0..<4 {
            let ny = y + dy[k]
            let nx = x + dx[k]
            let nd = d + 1
            if isValid(ny, nx) && !visited[ny][nx] && adj[ny][nx] == 1 { // 정상 좌표고, 방문한 적 없고, 길이 갈 수 있으면(1이면),
                visited[ny][nx] = true
                q.pushLast((ny, nx, nd))
            }
        }
    }
    
    return 1
    
}

let answer = bfs(0, 0)
print(answer)
