// MARK: - 1520번(DFS + DP)
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (M, N) = (input[0], input[1])

var arr: [[Int]] = Array(repeating: [], count: M + 1)
arr[0] = Array(repeating: 0, count: N + 1)
for i in 1...M {
    arr[i] = [0] + readLine()!.split(separator: " ").map{Int(String($0))!}
}

var dp: [[Int]] = Array(repeating: Array(repeating: -1, count: N + 1), count: M + 1)

func isValidCoord(_ y: Int, _ x: Int) -> Bool { // 유효범위 체크.
    return (1 <= y && y <= M) && (1 <= x && x <= N)
}

func isEscape(_ y: Int, _ x: Int) -> Bool { // 도착완료 체크.
    return y == M && x == N
}

let dy = [0, 1, 0, -1]
let dx = [1, 0, -1, 0]

func dfs(_ y: Int, _ x: Int) -> Int {
//    print(y, x, dp)
    if isEscape(y, x) { // 도착 시,
        return 1
    }
    
//    if dp[y][x] != -1 { // 방문 좌표일 시,
//        return dp[y][x]
//    }
    
    if dp[y][x] == -1 { // 미방문 좌표일 시,
        dp[y][x] = 0 // 우선 값 0으로 초기화.
        for k in 0..<4 {
            let ny = y + dy[k]
            let nx = x + dx[k]
            
            if isValidCoord(ny, nx) && arr[y][x] > arr[ny][nx] { // 유효범위이고, 높이가 낮으면,
                dp[y][x] += dfs(ny, nx)
            }
        }
    }
    
    return dp[y][x] // 방문 좌표일 시,
}

let answer = dfs(1, 1)
print(answer)
