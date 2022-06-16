// MARK: - 5502번(dp - LCS)
let N = Int(readLine()!)!
let arr: [String] = ["@"] + readLine()!.map{String($0)} // @는 인덱스 채우기용.
var dp = Array(repeating: Array(repeating: 0, count: N + 1), count: N + 1)

// LCS(최장 공통 부분수열)
for i in 1...N { // 뒤 부터 돌면서,
    for j in 1...N { // 앞 부터 돌면서,
        if arr[N + 1 - i] == arr[j] {
            dp[i][j] = dp[i - 1][j - 1] + 1 // (이전 행, 이전열의 값) + 1
        }
        else {
            dp[i][j] = max(dp[i - 1][j], dp[i][j - 1]) // max(이전 행의 같은 열, 같은 행의 이전 열)
        }
    }
}

// LCS(최장 공통 문자열)
//for i in 1...N { // 뒤 부터 돌면서,
//    for j in 1...N { // 앞 부터 돌면서,
//        if arr[N + 1 - i] == arr[j] {
//            dp[i][j] = dp[i - 1][j - 1] + 1
//        }
//    }
//}

var maxValue: Int = -1
for i in 1...N {
    maxValue = max(maxValue, dp[i].max()!)
}
print(N - maxValue) // N - LCS값이 정답.
