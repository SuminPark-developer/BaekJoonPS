// 백준 - 10026번(dfs 2개 사용 - 재귀함수)
let N = Int(readLine()!)!
var board = [[String]]() // 일반인
var boardChange = [[String]]() // 적록색약
var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: N), count: N)
for _ in 0..<N {
    board.append(readLine()!.map{String($0)})
}

boardChange = board
for i in 0..<N {
    for j in 0..<N {
        if boardChange[i][j] == "G" { // 적록색약 board 변경.
            boardChange[i][j] = "R"
        }
    }
}

let dy = [0, 1, 0, -1]
let dx = [1, 0, -1, 0]
var count1: Int = 0 // 일반인 구역 수
var count2: Int = 0 // 적록색약 구역 수

func isValidCoord(_ y: Int, _ x: Int) -> Bool {
    return (0 <= y && y < N) && (0 <= x && x < N)
}

func dfs1(_ y: Int, _ x: Int) { // 일반인 dfs
    for k in 0..<4 {
        let ny = y + dy[k]
        let nx = x + dx[k]
        
        if isValidCoord(ny, nx) && (visited[ny][nx] == false) && (board[y][x] == board[ny][nx]) { // 같은 색이면,
            visited[ny][nx] = true
            dfs1(ny, nx)
        }
    }
}

func dfs2(_ y: Int, _ x: Int) { // 적록색약 dfs
    for k in 0..<4 {
        let ny = y + dy[k]
        let nx = x + dx[k]
        
        if isValidCoord(ny, nx) && (visited[ny][nx] == false) && (boardChange[y][x] == boardChange[ny][nx]) { // 같은 색이면,
            visited[ny][nx] = true
            dfs2(ny, nx)
        }
    }
}


for i in 0..<N {
    for j in 0..<N {
        
        if visited[i][j] == false {
            visited[i][j] = true
            count1 += 1
            dfs1(i, j)
        }
    }
}

visited = Array(repeating: Array(repeating: false, count: N), count: N) // 방문기록 초기화
for i in 0..<N {
    for j in 0..<N {
        
        if visited[i][j] == false {
            visited[i][j] = true
            count2 += 1
            dfs2(i, j)
        }
    }
}

print(count1, count2)
