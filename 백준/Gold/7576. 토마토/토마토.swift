// MARK: - 7576번(BFS)
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
let (M, N) = (input[0], input[1])

var board: [[Int]] = []

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    board.append(input)
}

func isValidCoord(_ y: Int, _ x: Int) -> Bool {
    return (0 <= y && y < N) && (0 <= x && x < M)
}

var visited = Array(repeating: Array(repeating: -1, count: M), count: N)

let dy = [0, 1, 0, -1]
let dx = [1, 0, -1, 0]
let q: Dequeue<(Int, Int)> = Dequeue([])

var count: Int = 0
func bfs() {
    while !q.isEmpty {
        let (y, x) = q.popFirst()
        
        for k in 0..<4 {
            let ny = y + dy[k]
            let nx = x + dx[k]
            
            if isValidCoord(ny, nx) && board[ny][nx] == 0 && visited[ny][nx] == -1 { // 유효 범위고, 연결되어 있고, 미방문상태이면
                visited[ny][nx] = visited[y][x] + 1
                q.pushLast((ny, nx))
            }
        }
    }
    
}


for y in 0..<N {
    for x in 0..<M {
        if board[y][x] == 1 {
            visited[y][x] = 0
            q.pushLast((y, x))
        }
        if board[y][x] == -1 { // 벽인 경우,
            visited[y][x] = -2 // 아예 다른 숫자
        }
    }
}
bfs()

if visited.flatMap({$0}).contains(-1) { // 미방문 있는 경우
    print(-1)
}
else {
    print(visited.flatMap{$0}.max()!)
}
