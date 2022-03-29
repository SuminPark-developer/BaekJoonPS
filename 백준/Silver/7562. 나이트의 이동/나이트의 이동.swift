// MARK: - 7562번
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

let T = Int(readLine()!)!

let dx = [1, 2, 2, 1, -1, -2, -2, -1]
let dy = [2, 1, -1, -2, -2, -1, 1, 2]


for _ in 0..<T {
    let l = Int(readLine()!)!
    var board = Array(repeating: Array(repeating: 0, count: l), count: l)
    var visited = Array(repeating: Array(repeating: -1, count: l), count: l)
    
    var input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (stX, stY) = (input[0], input[1])
    input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (endX, endY) = (input[0], input[1])
    
    board[stY][stX] = 1
    board[endY][endX] = 2 // 임의로 2로 정함.
    
    
    func isValidCoord(_ y: Int, _ x: Int) -> Bool {
        return (0 <= y && y < l) && (0 <= x && x < l)
    }
    
    func isEscape(_ y: Int, _ x: Int) -> Bool {
        return board[y][x] == 2 // board값이 (임의로 정한) 2일 때 탈출.
    }
    
    func bfs(_ startY: Int, _ startX: Int) -> Int {
        let q = Dequeue([(startY, startX)])
        visited[startY][startX] = 0
        
        while !q.isEmpty {
            let (y, x) = q.popFirst()
            
            if isEscape(y, x) { // 목표에 도달하면,
                return visited[y][x]
            }
            
            for k in 0..<8 {
                let ny = y + dy[k]
                let nx = x + dx[k]
                
                if isValidCoord(ny, nx) && visited[ny][nx] == -1 && board[ny][nx] != 1 { // 유효 범위고, 방문한적이 없고, 시작지점이 아니면,
                    visited[ny][nx] = visited[y][x] + 1
                    q.pushLast((ny, nx))
                }
            }
            
        }
        return -1 // 불가능 시 -1 return.
    }
    
    let answer = bfs(stY, stX)
    print(answer)
}
