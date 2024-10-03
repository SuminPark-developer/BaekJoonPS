// MARK: - 14940번
class Deque<T> {
    var enque: [T]
    var deque: [T] = []
    
    var count: Int {
        return enque.count + deque.count
    }
    
    var isEmpty: Bool {
        return enque.isEmpty && deque.isEmpty
    }
    
    init(_ queue: [T]) {
        self.enque = queue
    }
    
    func pushFirst(_ element: T) {
        deque.append(element)
    }
    
    func pushLast(_ element: T) {
        enque.append(element)
    }
    
    func popFirst() -> T {
        if deque.isEmpty {
            deque = enque.reversed()
            enque.removeAll()
        }
        return deque.popLast()!
    }
    
    func popLast() -> T {
        if enque.isEmpty {
            enque = deque.reversed()
            deque.removeAll()
        }
        return enque.popLast()!
    }
}

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (n, m) = (input[0], input[1])

var board: [[Int]] = []
board.append(Array(repeating: 0, count: m + 1))

var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: m + 1), count: n + 1)

var goal: (y: Int, x: Int) = (0, 0)
for y in 1...n {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    board.append([0] + input)
    for (x, num) in input.enumerated() {
        if num == 2 {
            goal = (y, x + 1)
        }
    }
}

func isValidCoord(_ y: Int, _ x: Int) -> Bool { // 유효 범위 체크
    return (1 <= y && y <= n) && (1 <= x && x <= m)
}

var answer: [[Int]] = Array(repeating: Array(repeating: 0, count: m), count: n)
let dy = [0, 1, 0, -1]
let dx = [1, 0, -1, 0]

func bfs(_ startY: Int, _ startX: Int) {
    visited[startY][startX] = true
    let q = Deque([(startY, startX, 0)])
    
    while !q.isEmpty {
        let (y, x, count) = q.popFirst()
        answer[y - 1][x - 1] = count
        
        for k in 0..<4 {
            let ny = y + dy[k]
            let nx = x + dx[k]
            
            if isValidCoord(ny, nx) && (board[ny][nx] == 1 || board[ny][nx] == 2) && (!visited[ny][nx]) { // 유효범위이고, 갈 수 있는 땅이고, 미방문상태이면
                visited[ny][nx] = true
                q.pushLast((ny, nx, count + 1))
            }
        }
    }
}

bfs(goal.y, goal.x)

for y in 1...n {
    for x in 1...m {
        if !visited[y][x] && board[y][x] == 1 { // 원래 갈 수 있는 땅이지만 미방문 상태(도달할 수 없는 위치)
            answer[y - 1][x - 1] = -1
        }
    }
}

for ans in answer {
    print(ans.map{String($0)}.joined(separator: " "))
}
