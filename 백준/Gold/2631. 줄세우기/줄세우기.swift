// MARK: - 2631번(DP - 반복문 / LIS - 이중반복문)
let N = Int(readLine()!)!
var arr: [Int] = []
for _ in 0..<N {
    arr.append(Int(readLine()!)!)
}

var dp = Array(repeating: 1, count: N) // LIS를 저장하는 dp배열.

for i in 1..<N {
    for j in 0..<i {
        if arr[j] < arr[i] { // 증가하는 배열일 때,
            dp[i] = max(dp[i], dp[j] + 1)
        }
    }
}

let answer: Int = N - dp.max()! // N - LIS
print(answer)
