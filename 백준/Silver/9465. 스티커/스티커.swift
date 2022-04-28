// MARK: - 9465번(DP - 반복문)
let T = Int(readLine()!)!

for _ in 0..<T {
    let n = Int(readLine()!)!
    var arr: [[Int]] = Array(repeating: [], count: 2)
    
    arr[0] = readLine()!.split(separator: " ").map{Int(String($0))!}
    arr[1] = readLine()!.split(separator: " ").map{Int(String($0))!}
    
    var dp = Array(repeating: Array(repeating: -1, count: n), count: 2)
    dp[0][0] = arr[0][0] // a
    dp[1][0] = arr[1][0] // b
    
    if n >= 2 {
        dp[0][1] = arr[1][0] + arr[0][1] // (b+c)
        dp[1][1] = arr[0][0] + arr[1][1] // (a+d)
        
        for i in 2..<n {
            dp[0][i] = max(dp[1][i-1], dp[1][i-2]) + arr[0][i] // 위쪽
            dp[1][i] = max(dp[0][i-1], dp[0][i-2]) + arr[1][i] // 아래쪽
        }
    }
    
    let answer = max(dp[0][n-1], dp[1][n-1])
    print(answer)
}
