// MARK: - 14940번(BFS)
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
let (n, m) = (input[0], input[1])

var board: [[Int]] = []
board.append(Array(repeating: 0, count: m + 1))

var goal: (y: Int, x: Int) = (0, 0)

for y in 1...n {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    board.append([0] + input)
    for (x, val) in input.enumerated() {
        if val == 2 {
            goal = (y, x + 1)
        }
    }
}

var answer: [[Int]] = Array(repeating: Array(repeating: 0, count: m), count: n)
var visited = Array(repeating: Array(repeating: false, count: m + 1), count: n + 1)

func isValidCoord(_ y: Int, _ x: Int) -> Bool {
    return (1 <= y && y <= n) && (1 <= x && x <= m)
}

let dy = [0, 1, 0, -1]
let dx = [1, 0, -1, 0]
func bfs(_ startY: Int, _ startX: Int) {
    visited[startY][startX] = true // (제일 처음 방문) 목표지점 - 방문으로 설정.
    let q = Dequeue([(startY, startX, 0)])
    
    while !q.isEmpty {
        let (y, x, count) = q.popFirst()
        answer[y - 1][x - 1] = count
        
        for k in 0..<4 {
            let ny = y + dy[k]
            let nx = x + dx[k]
            
            if isValidCoord(ny, nx) && (board[ny][nx] == 1 || board[ny][nx] == 2) && !visited[ny][nx] { // 유효 범위고, 연결된 상태이고, 미방문 상태이면
                visited[ny][nx] = true
                q.pushLast((ny, nx, count + 1))
            }
        }
    }
    
}

bfs(goal.y, goal.x)

for y in 1...n {
    for x in 1...m {
        if !visited[y][x] && board[y][x] == 1 { // 원래 갈 수 있는 상태인데 미방문 상태이면, (도달 못한 위치)
            answer[y - 1][x - 1] = -1
        }
    }
}

for ans in answer {
    print(ans.map{String($0)}.joined(separator: " "))
}
