// MARK: - 10870번(DP - 반복문)
let n = Int(readLine()!)!
var dp = Array(repeating: -1, count: 21)
dp[0] = 0
dp[1] = 1

if n >= 2 {
    for i in 2...n {
        dp[i] = dp[i - 1] + dp[i - 2]
    }
}

print(dp[n])
