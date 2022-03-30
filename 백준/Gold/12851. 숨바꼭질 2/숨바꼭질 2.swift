// MARK: - 12851번(BFS)
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
let (N, K) = (input[0], input[1])
var board = Array(repeating: 0, count: 100001) // 0부터 100000까지.
var visited = Array(repeating: false, count: 100001)

func isValidCoord(_ x: Int) -> Bool {
    return (0 <= x && x <= 100000)
}

func isEscape(_ x: Int) -> Bool { // 수빈이를 만나면 탈출.
    return (x == K)
}

var fastTimeArray: [Int] = []
func bfs(_ startX: Int) {
    let q = Dequeue([(startX, 0)])
    visited[startX] = true // 첫 시작 true로 초기화.
    
    while !q.isEmpty {
        let (x, d) = q.popFirst()
        visited[x] = true // 숨바꼭질1과 다르게, 큐에서 pop할 때 방문처리해줘야 함.
        
        if isEscape(x) { // 탈출 가능인데,
            if fastTimeArray.isEmpty { // 처음이면,
                fastTimeArray.append(d)
            }
            else { // 처음이 아닌데,
                if d == fastTimeArray[0] { // 가장 빠른 시간과 같다면 방법 1개 증가.
                    fastTimeArray.append(d)
                }
            }
        }
        
        if isValidCoord(x + 1) && board[x + 1] == 0 && visited[x + 1] == false { // (x+1) - 유효 범위고, 방문할 수 있는 곳이고, 방문한 적 없으면,
            q.pushLast((x+1, d+1))
        }
        if isValidCoord(x - 1) && board[x - 1] == 0 && visited[x - 1] == false { // (x-1) - 유효 범위고, 방문할 수 있는 곳이고, 방문한 적 없으면,
            q.pushLast((x-1, d+1))
        }
        if isValidCoord(2 * x) && board[2 * x] == 0 && visited[2 * x] == false { // (2*x) - 유효 범위고, 방문할 수 있는 곳이고, 방문한 적 없으면,
            q.pushLast((2*x, d+1))
        }
    }
    
}

bfs(N)
print(fastTimeArray.first!)
print(fastTimeArray.count)
