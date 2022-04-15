// MARK: - 10870번(DP - 재귀)
let n = Int(readLine()!)!

var dp = Array(repeating: -1, count: 21)
dp[0] = 0
dp[1] = 1

func fibo(_ N: Int) -> Int {
    if dp[N] == -1 {
        dp[N] = fibo(N - 2) + fibo(N - 1)
    }
    
    return dp[N]
}

print(fibo(n))
