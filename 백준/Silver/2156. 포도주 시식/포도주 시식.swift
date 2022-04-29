// MARK: - 2156번(DP - 재귀함수)
let n = Int(readLine()!)!
var arr = [0] + Array(repeating: 0, count: 10000) // 0번째는 무시.
var dp = [-1] + Array(repeating: -1, count: 10000) // 0번째는 무시.

for i in 1...n {
    arr[i] = Int(readLine()!)!
}

func topDown(_ N: Int) -> Int {
    if dp[N] != -1 {
        return dp[N]
    }
    if N <= 3 {
        dp[1] = arr[1]
        dp[2] = arr[1] + arr[2]
        dp[3] = max(arr[1] + arr[2], arr[1] + arr[3], arr[2] + arr[3]) // 인덱스 1 + 2, 1 + 3, 2 + 3
    }
    else {
        let case1 = arr[N] + arr[N - 1] + topDown(N - 3) // 현재잔 + 직전잔 + N-3위치의 최대값
        let case2 = arr[N] + topDown(N - 2) // 현재잔 + N-2위치의 최대값
        let case3 = topDown(N - 1) // 현재잔X -> N-1위치의 최대값
        dp[N] = max(case1, case2, case3)
    }
    return dp[N]
}

print(topDown(n))

