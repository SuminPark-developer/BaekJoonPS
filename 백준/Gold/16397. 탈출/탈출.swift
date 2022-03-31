// MARK: - 16397번(BFS)
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
let (N, T, G) = (input[0], input[1], input[2])
var visited = Array(repeating: false, count: 100000) // 0~99999 미방문 체크.

func isValidCoord(_ x: Int) -> Bool {
    return (0 <= x && x <= 99999)
}

func isEscape(_ x: Int) -> Bool {
    return (x == G)
}

func bfs(_ startX: Int) -> Int {
    let q = Dequeue([(startX, 0)])
    visited[startX] = true
    
    while !q.isEmpty {
        let (x, d) = q.popFirst()
        
        if isEscape(x) {
            return d
        }
        
        if isValidCoord(x + 1) && !visited[x + 1] && (d < T) { // 유효 범위고, 방문한 적 없고, 버튼 누른 회수가 T회 미만이면,
            visited[x + 1] = true
            q.pushLast((x + 1, d + 1))
        }
        
        if isValidCoord(2 * x) { // 2배한 숫자가 유효 범위고,
            var temp = String(2 * x).map{String($0)}
            for i in 0..<temp.count {
                if temp[i] != "0" {
                    temp[i] = String(Int(temp[i])! - 1)
                    break
                }
            }
            let pressB = Int(temp.reduce("", +))! // B를 누른 결과 숫자.
            if !visited[pressB] && (d < T) { // B를 누른 결과의 숫자에 방문한 적 없고, 버튼 누른 회수가 T회 미만이면,
                visited[pressB] = true
                q.pushLast((pressB, d + 1))
            }
        }
    }
    return -1
}

let answer = bfs(N)
answer == -1 ? print("ANG") : print(answer)
