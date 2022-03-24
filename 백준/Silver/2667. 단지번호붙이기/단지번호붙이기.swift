// 백준 - 2667번(dfs사용 - 재귀함수)
let N = Int(readLine()!)!
var board: [[Character]] = [[Character]]()
var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: N), count: N)

for _ in 0..<N {
    board.append(readLine()!.map{$0})
}

let dy = [0, 1, 0, -1]
let dx = [1, 0, -1, 0]

func isValidCoord(_ y: Int, _ x: Int) -> Bool {
    return (0 <= y && y < N) && (0 <= x && x < N)
}

var count: Int = 0
func dfs(_ y: Int, _ x: Int) {
    
    visited[y][x] = true
    count += 1
    
    for k in 0..<4 {
        let ny = y + dy[k]
        let nx = x + dx[k]
        
        if isValidCoord(ny, nx) && visited[ny][nx] == false && board[ny][nx] == "1" {
//            visited[ny][nx] = true
//            count += 1
            dfs(ny, nx)
        }
        
    }
    
}

var home = [Int]()

for i in 0..<N {
    for j in 0..<N {
        if visited[i][j] == false && board[i][j] == "1" {
            count = 0
            dfs(i, j)
            home.append(count)
        }
    }
}

print(home.count)
home.sort()
for i in home {
    print(i)
}
