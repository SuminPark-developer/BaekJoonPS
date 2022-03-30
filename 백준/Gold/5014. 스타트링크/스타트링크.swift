// MARK: - 5014번(BFS)
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
let (F, S, G, U, D) = (input[0], input[1], input[2], input[3], input[4])
var board = Array(repeating: Array(repeating: 0, count: 1), count: F + 1) // (0층 제외) 1층부터 F층까지 생성.
var visited = Array(repeating: Array(repeating: -1, count: 1), count: F + 1) // (0층 제외) 1층부터 F층까지 생성.
board[0][0] = -1 // 0층은 제외.

func isValidCoord(_ y: Int, _ x: Int) -> Bool {
    return (1 <= y && y <= F) && (x == 0)
}

func isEscape(_ y: Int, _ x: Int) -> Bool {
    return (y == G) && (x == 0) // 목표(G)층에 도달하면 탈출.
}

let dy = [U, (D * -1)] // 위나 아래로만 이동 가능.

func bfs(_ startY: Int, _ startX: Int) -> Int {
    let q = Dequeue([(startY, startX)])
    visited[startY][startX] = 0 // 시작부분 0으로 시작.
    
    while !q.isEmpty {
        let (y, x) = q.popFirst()
        
        if isEscape(y, x) {
            return visited[y][x]
        }
        
        for k in 0..<2 {
            let ny = y + dy[k]
            let nx = x // x는 계속 0
            
            if isValidCoord(ny, nx) && board[ny][nx] == 0 && visited[ny][nx] == -1 { // 유효 범위고, (0층제외한) 1층부터 F층이고, 미방문이면,
                visited[ny][nx] = visited[y][x] + 1
                q.pushLast((ny, nx))
            }
        }
    }
    return -1
}

let answer = bfs(S, 0) // S층에서 시작.
answer == -1 ? print("use the stairs") : print(answer)
