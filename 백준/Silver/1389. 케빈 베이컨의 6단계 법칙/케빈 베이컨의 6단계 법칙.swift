// MARK: - 1389번(BFS)
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, M) = (input[0], input[1])

var board: [[Int]] = Array(repeating: Array(repeating: 0, count: N + 1), count: N + 1) // 0인덱스는 자리채우기 용.
var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: N + 1), count: N + 1) // 0인덱스는 자리채우기 용.

for _ in 0..<M {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (A, B) = (input[0], input[1])
    
    board[A][B] = 1
    board[B][A] = 1
}

func visitedArrayInit() { // 방문배열 초기화 필요.
    visited = Array(repeating: Array(repeating: false, count: N + 1), count: N + 1) // 0인덱스는 자리채우기 용.
    for i in 1...N {
        visited[i][i] = true
    }
}


func bfs(_ y: Int, _ destination: Int) -> Int {
    var q: [(Int, Int)] = [(y, 0)] // (y, count)
    
    while !q.isEmpty {
        let (y, count) = q.removeFirst()
        
        for k in 1...N {
            if board[y][k] == 1 && !visited[y][k] {
                visited[y][k] = true
                if k == destination { // 목적지 도착이면,
                    return count + 1
                }
                q.append((k, count + 1))
            }
        }
    }
    return -1
}


var answerIndex: Int = 1
var minValue: Int = Int.max

for start in 1...N {
    var sum: Int = 0
    for destination in 1...N {
        if start != destination { // 자기자신은 제외.
            sum += bfs(start, destination)
            visitedArrayInit() // 방문배열 초기화.
        }
    }
    if sum < minValue { // 더 작은 케빈 베이컨의 수(sum)가 등장 시,
        minValue = sum
        answerIndex = start
    }
}
print(answerIndex)
