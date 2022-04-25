// MARK: - 11055번(DP - 바텀업)
let N = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int(String($0))!}
var dp = Array(repeating: 0, count: N)
dp[0] = arr[0]


for i in 1..<N {
    let standard = arr[i] // 기준(자신)
    var maxValue = 0
    for j in 0..<i {
        if arr[j] < standard { // 기준보단 작지만,
            maxValue = max(maxValue, dp[j]) // 그 중 제일 큰 dp값에
        }
    }
    dp[i] = maxValue + standard // 자기자신을 더한게 dp[n]값.
}

print(dp.max()!)
