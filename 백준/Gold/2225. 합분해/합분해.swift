// MARK: - 2225번(DP - 반복문(1))
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, K) = (input[0], input[1])

var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: N + 1), count: K + 1)

for i in 0...N {
    dp[1][i] = 1
}

for i in 1...K {
    for j in 0...N {
        for l in 0...j {
            dp[i][j] += dp[i - 1][j - l]
            dp[i][j] %= 1000000000
        }
    }
}

print(dp[K][N])
