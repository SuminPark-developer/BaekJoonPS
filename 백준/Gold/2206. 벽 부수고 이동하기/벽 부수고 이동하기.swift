// MARK: - 2206번(BFS)
// 참고) 방문여부를 이렇게 기록해야 하는 이유 - https://www.acmicpc.net/board/view/67446
// 참고) 풀이 참고 - https://velog.io/@aurora_97/%EB%B0%B1%EC%A4%80-2206%EB%B2%88-%EB%B2%BD-%EB%B6%80%EC%88%98%EA%B3%A0-%EC%9D%B4%EB%8F%99%ED%95%98%EA%B8%B0-Swift
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
var board: [[Int]] = []
var visited = Array(repeating: Array(repeating: [0, 0], count: M), count: N) // [0, 0]에서 - 왼쪽은 벽미사용 방문거리, 오른쪽은 벽사용 방문거리

for _ in 0..<N {
    let input = readLine()!.map{Int(String($0))!}
    board.append(input)
}

func isValidCoord(_ y: Int, _ x: Int) -> Bool {
    return (0 <= y && y < N) && (0 <= x && x < M)
}

func isEscape(_ y: Int, _ x: Int) -> Bool {
    return (y == N - 1) && (x == M - 1)
}

let dy = [0, 1, 0, -1]
let dx = [1, 0, -1, 0]

func bfs(_ startY: Int, _ startX: Int) -> Int {
    let q = Dequeue([(startY, startX, 0)]) // 0이면 벽 미사용, 1이면 벽 사용
    visited[startY][startX][0] = 1 // 시작하는 칸도 포함.
    
    while !q.isEmpty {
        let (y, x, wall) = q.popFirst()
        
        if isEscape(y, x) {
            return (visited[y][x][wall])
        }
        
        for k in 0..<4 {
            let ny = y + dy[k]
            let nx = x + dx[k]
            
            if isValidCoord(ny, nx) {
                if board[ny][nx] == 1 && wall == 0 { // 벽이 있고, 벽 미사용이면,
                    visited[ny][nx][1] = visited[y][x][0] + 1 // 벽 사용한 방문거리에 저장.
                    q.pushLast((ny, nx, 1))
                }
                else if board[ny][nx] == 0 && visited[ny][nx][wall] == 0 { // 길이고, (벽을 쓰고 or 안쓰고) 미방문일 때,
                    visited[ny][nx][wall] = visited[y][x][wall] + 1
                    q.pushLast((ny, nx, wall))
                }
            }
        }
    }
    return -1
}


let answer = bfs(0, 0)
print(answer)
