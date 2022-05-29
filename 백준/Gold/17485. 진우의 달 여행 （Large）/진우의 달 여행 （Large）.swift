// MARK: - 17485번(DP - 반복문)
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, M) = (input[0], input[1])

var board: [[Int]] = Array(repeating: [], count: N + 1)
board[0] = Array(repeating: 0, count: M + 1)
for i in 1...N {
    board[i] = [0] + readLine()!.split(separator: " ").map{Int(String($0))!} // [0]은 인덱스 맞추기 위해.
}

var dp: [[[Int]]] = Array(repeating: Array(repeating: Array(repeating: Int.max, count: 3), count: M + 1), count: N + 1) // 0(↙), 1(↓), 2(↘)

for y in 1...N {
    if y == 1 { // 가장 첫 스타트일 땐 board값 dp에 저장.
        for x in 1...M {
            for d in 0..<3 {
                dp[y][x][d] = board[y][x]
            }
        }
    }
    else { // 2...N
        for x in 1...M {
            if x == 1 { // 가장 좌측일 때, 방향 0과 1은 가능. 2로 오는건 불가능.
                dp[y][x][0] = min(dp[y - 1][x + 1][1], dp[y - 1][x + 1][2]) + board[y][x] // 지난 행, 다음 열의 min(방향1, 방향2)값 + 현재값
                dp[y][x][1] = dp[y - 1][x][0] + board[y][x] // 지난 행, 같은 열의 값(방향0) + 현재값
            }
            else if x == M { // 가장 우측일 때, 방향 1과 2는 가능. 0으로 오는건 불가능.
                dp[y][x][2] = min(dp[y - 1][x - 1][0], dp[y - 1][x - 1][1]) + board[y][x] // 지난 행, 지난 열의 min(방향0, 방향1)값 + 현재값
                dp[y][x][1] = dp[y - 1][x][2] + board[y][x] // 지난 행, 같은 열의 값(방향2) + 현재값
            }
            else { // 그 외,
                dp[y][x][0] = min(dp[y - 1][x + 1][1], dp[y - 1][x + 1][2]) + board[y][x] // 지난 행, 다음 열의 min(방향1, 방향2)값 + 현재값
                dp[y][x][1] = min(dp[y - 1][x][0], dp[y - 1][x][2]) + board[y][x] // 지난 행, 같은 열의 min(방향0, 방향2)값 + 현재값
                dp[y][x][2] = min(dp[y - 1][x - 1][0], dp[y - 1][x - 1][1]) + board[y][x] // 지난 행, 지난 열의 min(방향0, 방향1)값 + 현재값
            }
        }
    }
}

var answer: Int = Int.max
for x in 1...M {
    answer = min(answer, dp[N][x].min()!)
}
print(answer)
