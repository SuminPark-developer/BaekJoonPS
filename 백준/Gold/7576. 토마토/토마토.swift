// MARK: - 7576번(BFS)
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
let dx = [1, 0, -1, 0]
let q: Deque<(Int, Int)> = Deque([])
func bfs() {
//func bfs(_ startY: Int, _ startX: Int) {
//    let q = Deque([(startY, startX)])
    
    while !q.isEmpty {
        let (y, x) = q.popFirst()
        
        for k in 0..<4 {
            let ny = y + dy[k]
            let nx = x + dx[k]
            
            if isValidCoord(ny, nx) && (board[ny][nx] == 0) && visited[ny][nx] == -1 { // 유효범위고, 인접(익을) 토마토고, 미방문 상태면,
                visited[ny][nx] = visited[y][x] + 1 // 익는 일자 + 1
                board[ny][nx] = 1 // 인접 토마토도 익음 (문제풀이에 불필요)
                q.pushLast((ny, nx))
            }
        }
    }
}


for y in 0..<N {
    for x in 0..<M {
        if board[y][x] == 1 { // 처음부터 익은 토마토면,
            visited[y][x] = 0 // 0일 걸림.
            q.pushLast((y, x))
        }
        else if board[y][x] == -1 { // 애초에 못가는 곳이면,
            visited[y][x] = -2 // 아예 상관없는 숫자 저장.
        }
    }
}
bfs()

let answerArray = visited.flatMap{$0}
let temp = [1, 3, 5]
if answerArray.contains(-1) { // 토마토가 모두 익지는 못하는 상황이면,
    print(-1)
}
else { // 모두 익는데 걸리는 시간
    print(answerArray.max()!)
}
