// MARK: - 2225번(DP - 반복문(2) : 시간 개선)
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, K) = (input[0], input[1])

var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: N + 1), count: K + 1)

for i in 1...K {
    dp[i][0] = 1
}

for i in 1...K {
    for j in 1...N {
        dp[i][j] = dp[i - 1][j] + dp[i][j - 1]
        dp[i][j] %= 1000000000
    }
}

print(dp[K][N])

