// MARK: - 2412번(BFS)
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
        self.enQueue = queue
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
let (n, T) = (input[0], input[1])
//var steps: [(y: Int, x: Int)] = []
var steps: Set<[Int]> = []

var maxTemp: Int = -1
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (y, x) = (input[1], input[0])
    steps.insert([y, x])
    maxTemp = max(maxTemp, x)
}
//print(steps)


func isValidCoord(_ y: Int, _ x: Int) -> Bool {
    return (0 <= y && y <= T) && (0 <= x && x <= maxTemp)
}

func isEscape(_ y: Int) -> Bool {
    return (y == T) // 정상 도달
}

let dy = [-2, -1, 0, 1, 2]
let dx = [-2, -1, 0, 1, 2]
func bfs(_ startY: Int, _ startX: Int) -> Int {
//    var q: [(Int, Int, Int)] = [(startY, startX, 0)]
    let q = Dequeue([(startY, startX, 0)])
//    visited[startY][startX] = true

    while !q.isEmpty {
        let (y, x, d) = q.popFirst()

        if isEscape(y) {
            return d
        }
        
        for k in 0..<5 { // -2 <= y <= 2
            for v in 0..<5 { // -2 <= x <= 2
                let ny = y + dy[k]
                let nx = x + dx[v]
                let nd = d + 1
                if isValidCoord(ny, nx) && steps.contains([ny, nx]) { // 유효 범위고, 그 자리에 홈이 있으면,
                    steps.remove([ny, nx]) // 홈 방문 했으니, 지움. (=얘가 방문체크를 대체함.)
                    q.pushLast((ny, nx, nd))
                }
            }
        }
    }
    return -1
}

let answer = bfs(0, 0)
print(answer)
