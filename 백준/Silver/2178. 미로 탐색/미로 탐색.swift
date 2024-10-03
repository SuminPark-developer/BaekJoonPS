// MARK: - 2178번(BFS)
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
let (N, M) = (input[0], input[1])

var board: [[Int]] = []
board.append(Array(repeating: 0, count: M + 1))
var visited = Array(repeating: Array(repeating: false, count: M + 1), count: N + 1)
for _ in 0..<N {
    let input = readLine()!.map{Int(String($0))!}
    board.append([0] + input)
}

func isValidCoord(_ y: Int, _ x: Int) -> Bool {
    return (1 <= y && y <= N) && (1 <= x && x <= M)
}

let dy = [0, 1, 0, -1]
let dx = [1, 0, -1, 0]

//var count: Int = 0
func bfs(_ startY: Int, _ startX: Int) {
    let q = Deque([(startY, startX, 1)])
    
    while !q.isEmpty {
        let (y, x, count) = q.popFirst()
        if y == N && x == M { // 종료 조건
            print(count)
//            break
        }
        
        for k in 0..<4 {
            let ny = y + dy[k]
            let nx = x + dx[k]
            if isValidCoord(ny, nx) && board[ny][nx] == 1 && !visited[ny][nx] { // 유효 범위이고, 연결되어 있는 길이고, 미방문 상태이면
                visited[ny][nx] = true
                q.pushLast((ny, nx, count + 1))
            }
        }
    }
}

bfs(1, 1)
