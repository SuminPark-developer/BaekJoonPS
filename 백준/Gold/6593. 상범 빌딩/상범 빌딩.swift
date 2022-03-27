// MARK: - 6593번
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

while true {
    
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (L, R, C) = (input[0], input[1], input[2])
    if (L == 0) && (R == 0) && (C == 0) {
        break
    }
    
    var board = Array(repeating: Array(repeating: Array(repeating: "", count: C), count: R), count: L)
    var visited = Array(repeating: Array(repeating: Array(repeating: false, count: C), count: R), count: L)

    for z in 0..<L {
        for y in 0..<R {
            let input = readLine()!.map{String($0)}
            for x in 0..<C {
                board[z][y][x] = input[x]
            }
        }
        readLine()
    }

    func isValidCoord(_ z: Int, _ y: Int, _ x: Int) -> Bool {
        return (0 <= z && z < L) && (0 <= y && y < R) && (0 <= x && x < C)
    }

    let dz = [0, 0, 0, 0, 1, -1]
    let dy = [0, 1, 0, -1, 0 ,0]
    let dx = [1, 0, -1, 0, 0, 0]
    
    func bfs(_ startZ: Int, _ startY: Int, _ startX: Int) -> Int {
        visited[startZ][startY][startX] = true
        let q = Dequeue([(startZ, startY, startX, 0)])
        
        while !q.isEmpty {
            let (z, y, x, d) = q.popFirst()
            
            for k in 0..<6 {
                let nz = z + dz[k]
                let ny = y + dy[k]
                let nx = x + dx[k]
                let nd = d + 1 // 이동 횟수(시간)
                if isValidCoord(nz, ny, nx) && !visited[nz][ny][nx] && board[nz][ny][nx] == "." { // 통로면,
                    visited[nz][ny][nx] = true
                    q.pushLast((nz, ny, nx, nd))
                }
                else if isValidCoord(nz, ny, nx) && !visited[nz][ny][nx] && board[nz][ny][nx] == "E" { // 탈출통로면,
                    visited[nz][ny][nx] = true
                    return nd // 탈출 시간 return.
                }
            }
        }
         
        return -1 // 탈출 불가 시, -1 return. (Trapped!)
        
    }
    
    var time: Int = 0
outLoop: for z in 0..<L {
        for y in 0..<R {
            for x in 0..<C {
                if !visited[z][y][x] && board[z][y][x] == "S" {
                    visited[z][y][x] = true
                    time = bfs(z, y, x)
                    break outLoop
                }
            }
        }
    }
    
    if time == -1 {
        print("Trapped!")
    }
    else {
        print("Escaped in \(time) minute(s).")
    }
    
}

