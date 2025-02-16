// MARK: - 1260번(DFS, BFS)
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, M, V) = (input[0], input[1], input[2])

var board: [[Int]] = Array(repeating: Array(repeating: 0, count: N + 1), count: N + 1)
var visited: [Bool] = Array(repeating: false, count: N + 1)
//var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: N + 1), count: N + 1)

for _ in 0..<M {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (y, x) = (input[0], input[1])
    board[y][x] = 1
    board[x][y] = 1
}

var answerDFS: [Int] = [V] // V는 무조건 첫방문

func dfs(_ index: Int) {
    visited[index] = true
    
    for next in 1...N {
        if board[index][next] == 1 && visited[next] == false { // 연결되어 있고, 미방문이면,
            visited[next] = true
            answerDFS.append(next)
            
            dfs(next)
        }
    }
}
dfs(V)

class Deque<T> {
    var enQue: [T]
    var deQue: [T] = []
    
    var count: Int {
        return enQue.count + deQue.count
    }
    
    var isEmpty: Bool {
        return enQue.isEmpty && deQue.isEmpty
    }
    
    init(_ que: [T]) {
        self.enQue = que
    }
    
    func pushFirst(_ element: T) {
        deQue.append(element)
    }
    
    func pushLast(_ element: T) {
        enQue.append(element)
    }
    
    func popFirst() -> T {
        if deQue.isEmpty {
            deQue = enQue.reversed()
            enQue.removeAll()
        }
        return deQue.popLast()!
    }
    
    func popLast() -> T {
        if enQue.isEmpty {
            enQue = deQue.reversed()
            deQue.removeAll()
        }
        return enQue.popLast()!
    }
}

visited = Array(repeating: false, count: N + 1)
var myDeque = Deque([V])
var answerBFS: [Int] = []

func BFS(_ index: Int) {
    visited[index] = true
    
    while !myDeque.isEmpty {
        let currentY = myDeque.popFirst()
        answerBFS.append(currentY)
        
        for next in 1...N {
            if board[currentY][next] == 1 && visited[next] == false {
                myDeque.pushLast(next)
                visited[next] = true
            }
        }
    }
}

BFS(V)
print(answerDFS.map{String($0)}.joined(separator: " "))
print(answerBFS.map{String($0)}.joined(separator: " "))
