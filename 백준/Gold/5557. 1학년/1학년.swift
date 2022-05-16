// MARK: - 5557번(DP - 반복문)
let N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Int(String($0))!}
var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: 21), count: N)

dp[0][arr[0]] = 1 // 가장 첫번째 숫자는 무조건 0~20에 포함됨.

for i in 1...N-2 {
    for j in 0...20 {
        if dp[i - 1][j] >= 1 {
            if j + arr[i] <= 20 { // 더했을 때, 20이하여야 가능.
                dp[i][j + arr[i]] += dp[i - 1][j]
            }
            
            if j - arr[i] >= 0 { // 뺐을 때, 0이상이어야 가능.
                dp[i][j - arr[i]] += dp[i - 1][j]
            }
        }
    }
}

print(dp[N - 2][arr[N - 1]])
