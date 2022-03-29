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
var visited = Array(repeating: Array(repeating: -1, count: M), count: N)

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    board.append(input)
}

func isValidCoord(_ y: Int, _ x: Int) -> Bool {
    return (0 <= y && y < N) && (0 <= x && x < M)
}

let dy = [0, 1, 0, -1]
let dx = [1, 0, -1 ,0]
let q: Dequeue<(Int, Int)> = Dequeue([])

func bfs() {
    
    while !q.isEmpty {
        let (y, x) = q.popFirst()
        
        for k in 0..<4 {
            let ny = y + dy[k]
            let nx = x + dx[k]
            
            if isValidCoord(ny, nx) && (visited[ny][nx] == -1) && board[ny][nx] == 0 { // 유효범위고, 방문한 적 없고, 익지 않은 토마토가 근처이면,
                visited[ny][nx] = visited[y][x] + 1
                q.pushLast((ny, nx))
            }
        }
    }
    
}

for y in 0..<N {
    for x in 0..<M {
        if board[y][x] == 1 { // 익은 토마토 발견 시,
            visited[y][x] = 0
            q.pushLast((y, x))
        }
        else if board[y][x] == -1 { // 토마토가 없는 칸 발견 시, 접근 자체가 불가능.
            visited[y][x] = -2 // 나중에 전체 토마토가 익었는지 체크를 위해, 미방문과 구분을 위해 -2로 둠.
        }
    }
}

bfs()

if visited.flatMap({$0}).contains(-1) { // 미방문한 토마토가 있으면,
    print(-1)
}
else { // 모든 토마토가 익었다면,
    print(visited.flatMap{$0}.max()!) // 최대값이 모두를 익게 하는 최소 일수임.
}
