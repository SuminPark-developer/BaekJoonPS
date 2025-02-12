// MARK: - 2606번(DFS)
let M = Int(readLine()!)!
let N = Int(readLine()!)!

var board: [[Int]] = Array(repeating: Array(repeating: 0, count: M + 1), count: M + 1)
var visited = Array(repeating: false, count: M + 1)

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (y, x) = (input[0], input[1])
    
    board[y][x] = 1
    board[x][y] = 1
}

func dfs(_ index: Int) {
    
    for next in 1...M {
        if board[index][next] == 1 && visited[next] == false {
            visited[next] = true
            dfs(next)
        }
    }
}

dfs(1) // 1번컴퓨터 감염 시작
visited[1] = false // 1번컴퓨터는 제외
print(visited.filter{$0 == true}.count)
