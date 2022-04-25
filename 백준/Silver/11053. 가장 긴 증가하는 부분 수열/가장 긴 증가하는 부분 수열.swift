// MARK: - 11053번 다시
let N = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int(String($0))!}
var dp = Array(repeating: 0, count: N)
dp[0] = 1

for i in 1..<N {
    let standard = arr[i]
    var maxValue = 0
    for j in 0..<i {
        if arr[j] < standard { // 기준보다 작지만,
            maxValue = max(maxValue, dp[j]) // 그 중 제일 큰 dp값에
        }
    }
    dp[i] = maxValue + 1 // 1을 더한게 dp[n]값.
}

print(dp.max()!)
