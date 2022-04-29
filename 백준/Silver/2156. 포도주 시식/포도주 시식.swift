// MARK: - 2156번(DP - 반복문)
let n = Int(readLine()!)!
var arr = [0] + Array(repeating: 0, count: 10000) // 0번째는 무시.
var dp = [0] + Array(repeating: 0, count: 10000) // 0번째는 무시.

for i in 1...n {
    arr[i] = Int(readLine()!)!
}

dp[1] = arr[1]
dp[2] = arr[1] + arr[2]
dp[3] = max(arr[1] + arr[2], arr[1] + arr[3], arr[2] + arr[3]) // 인덱스 1 + 2, 1 + 3, 2 + 3

if n >= 4 {
    for i in 4...n {
        let case1 = arr[i] + arr[i - 1] + dp[i - 3] // 현재잔 + 직전잔 + i-3위치의 최대값
        let case2 = arr[i] + dp[i - 2] // 현재잔 + i-2위치의 최대값
        let case3 = dp[i - 1] // 현재잔X -> i-1위치의 최대값
        dp[i] = max(case1, case2, case3)
    }
}
print(dp.max()!)
