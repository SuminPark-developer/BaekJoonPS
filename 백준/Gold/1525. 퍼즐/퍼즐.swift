// MARK: - 1525번(BFS)
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

let target = "123456780"
var board: [String] = []
var visited: Set<[String]> = []

for _ in 0..<3 {
    let input = readLine()!.split(separator: " ").map{String($0)}
    board.append(input[0])
    board.append(input[1])
    board.append(input[2])
}

var startY: Int = 0
var startX: Int = 0

for (index, ch) in board.enumerated() {
    if ch == "0" {
        startY = index / 3
        startX = index % 3
        break
    }
}

func isValidCoord(_ y: Int, _ x: Int) -> Bool {
    return (0 <= y && y < 3) && (0 <= x && x < 3)
}

func isEscape(_ arr: [String]) -> Bool {
    return arr.reduce("", +) == target
}

let dy = [0, 1, 0, -1]
let dx = [1, 0, -1, 0]

func bfs(_ startY: Int, _ startX: Int) -> Int {
    let q = Dequeue([(startY, startX, 0, board)])
    visited.insert(board)
    
    while !q.isEmpty {
        var (y, x, d, strArray) = q.popFirst()
//        print("\(y), \(x), \(d), \(visited)")
        
        if isEscape(strArray) {
            return d
        }
        
        for k in 0..<4 {
            let ny = y + dy[k]
            let nx = x + dx[k]
            let nd = d + 1
            
            if isValidCoord(ny, nx) { // 유효한 범위이면서,
                let index = y * 3 + x
                let nextIndex = ny * 3 + nx
                let temp = strArray[index] // swap.
                strArray[index] = strArray[nextIndex]
                strArray[nextIndex] = temp
                
                if !visited.contains(strArray) { // 방문한 적 없으면,
                    visited.insert(strArray)
                    q.pushLast((ny, nx, nd, strArray))
                }
                
                strArray[nextIndex] = strArray[index] // strArray를 망가뜨리면 안되기 때문에 다시 재swap.
                strArray[index] = temp
            }
        }
    }
    return -1
}


let answer = bfs(startY, startX)
print(answer)
