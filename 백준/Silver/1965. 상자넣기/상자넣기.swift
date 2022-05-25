// MARK: - 1965번(DP - 반복문 / LIS - 이중반복문)
let n = Int(readLine()!)!
var arr: [Int] = readLine()!.split(separator: " ").map{Int(String($0))!}
var dp = Array(repeating: 1, count: n)

for i in 1..<n {
    for j in 0..<i {
        if arr[j] < arr[i] {
            dp[i] = max(dp[i], dp[j] + 1)
        }
    }
}

print(dp.max()!)
