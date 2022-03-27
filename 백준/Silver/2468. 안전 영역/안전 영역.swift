// 백준 - 2468번
let N = Int(readLine()!)!
var board = [[Int]]()

for _ in 0..<N {
    board.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

var rainMaxArray = [Int]()
for i in 0..<N {
    rainMaxArray.append(board[i].max()!)
}
let rainMax = rainMaxArray.max()! // 물 최대 높이

var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: N), count: N)

let dy = [0, 1, 0, -1]
let dx = [1, 0, -1, 0]

func isValidCoord(_ y: Int, _ x: Int) -> Bool {
    return (0 <= y && y < N) && (0 <= x && x < N)
}

func dfs(_ y: Int, _ x: Int, _ height: Int) {
    for k in 0..<4 {
        let ny = y + dy[k]
        let nx = x + dx[k]
        
        if isValidCoord(ny, nx) && visited[ny][nx] == false && board[ny][nx] > height {
            visited[ny][nx] = true
            dfs(ny, nx, height)
        }
        
    }
}

var answer = [Int]()
var count: Int = 0
for k in 0...rainMax { // 빗물 높이(k)마다
    for i in 0..<N {
        for j in 0..<N {
            if visited[i][j] == false && board[i][j] > k { // 높이가 빗물 높이(k)보다 높다면, (=안전한 영역)
                visited[i][j] = true
                count += 1
                dfs(i, j, k)
            }
        }
    }
    answer.append(count) // 빗물 높이(k) 마다 안전한 영역 개수를 저장.
    count = 0 // 영역 개수 초기화. (다음 빗물 높이(k)의 안전한 영역을 구해야 하니깐)
    visited = Array(repeating: Array(repeating: false, count: N), count: N) // 방문 기록 초기화. (다음 빗물 높이(k)의 안전한 영역을 구해야 하니깐)
}

print(answer.max()!)
