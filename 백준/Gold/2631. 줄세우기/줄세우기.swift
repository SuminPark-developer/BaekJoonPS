// MARK: - 2631번(DP - 반복문)
let N = Int(readLine()!)!
var ans = Array(0...N) // https://stackoverflow.com/questions/34571043/how-to-create-an-array-with-incremented-values-in-swift
var arr: [Int] = [0]
for _ in 0..<N {
    arr.append(Int(readLine()!)!)
}

var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: N + 1), count: N + 1)

for i in 1...N {
    for j in 1...N {
        if ans[i] == arr[j] { // 숫자가 같으면,
            dp[i][j] = dp[i - 1][j - 1] + 1
        }
        else { // 숫자가 다르면,
            dp[i][j] = max(dp[i][j - 1], dp[i - 1][j]) // 왼쪽과 위쪽 중 큰 값.
        }
    }
}

let answer: Int = N - dp[N][N] // N - LCS
print(answer)
