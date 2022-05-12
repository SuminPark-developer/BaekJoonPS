// MARK: - 9084번(DP - 반복문)
let T = Int(readLine()!)!

for _ in 0..<T {
    let N = Int(readLine()!)!
    let coins: [Int] = readLine()!.split(separator: " ").map{Int(String($0))!}
    let M = Int(readLine()!)!
    var dp: [Int] = [1] + Array(repeating: 0, count: M)
    
    for coin in coins {
        for i in stride(from: coin, through: M, by: 1) {
            dp[i] = dp[i] + dp[i - coin]
        }
    }
    
    print(dp[M])
}
