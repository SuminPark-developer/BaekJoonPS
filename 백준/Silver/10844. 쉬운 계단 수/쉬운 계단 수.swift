// MARK: - 10844번(DP - 반복문)
let N = Int(readLine()!)!
var dp = Array(repeating: Array(repeating: 0, count: 10), count: N + 1)

for j in 1...9 { // N은 1이고, 1부터 9일 때
    dp[1][j] = 1
}

let mod = 1000000000 // mod로 나눈 나머지.
if N >= 2 {
    for i in 2...N {
        for j in 0...9 {
            if j == 0 {
                dp[i][j] = (dp[i - 1][1]) % mod // = dp[i-1][j+1] % mod
            }
            else if j >= 1 && j <= 8 {
                dp[i][j] = (dp[i - 1][j - 1] + dp[i - 1][j + 1]) % mod
            }
            else if j == 9 {
                dp[i][j] = (dp[i - 1][8]) % mod // = dp[i-1][j-1] % mod
            }
        }
    }
}

let sum = dp[N].reduce(0, +) % mod // 길이가 N인 계단 수의 개수.
print(sum)
