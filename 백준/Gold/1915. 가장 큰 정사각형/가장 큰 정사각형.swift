// MARK: - 1915번(DP - 반복문)
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (n, m) = (input[0], input[1])
var arr: [[Int]] = []
for _ in 0..<n {
    arr.append(readLine()!.map{Int(String($0))!})
}

var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: m), count: n)

for i in 0..<n { // 초기세팅 - 0열
    dp[i][0] = arr[i][0]
}

for j in 0..<m { // 초기세팅 - 0행
    dp[0][j] = arr[0][j]
}


for i in 1..<n {
    for j in 1..<m {
        if arr[i][j] == 0 { // 값이 0이면,
            dp[i][j] = 0 // 사각형이 애초에 불가능.
        }
        else { // 값이 1이면,
            dp[i][j] = min(dp[i - 1][j - 1], dp[i - 1][j], dp[i][j - 1]) + 1 // ↖, ↑, ← 중 최소값 + 1
        }
    }
}

var maxValue: Int = -1
for i in 0..<n { // 각 행을 돌면서,
    maxValue = max(maxValue, dp[i].max()!) // 최대값 비교.
}
print(maxValue * maxValue)
