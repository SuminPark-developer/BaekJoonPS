// MARK: - 2758번(DP - 반복문)
let T = Int(readLine()!)!

for _ in 0..<T {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n, m) = (input[0], input[1])
    
    var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)
    
    for j in 1...m { // 초기세팅 - 1개 고를 때
        dp[1][j] = j
    }
    
    for i in stride(from: 2, through: n, by: 1) { // n이 1일 때 error를 방지하기 위해.
        for j in 1...m {
            dp[i][j] = dp[i][j - 1] + dp[i - 1][j / 2] // 이전열 값 + 이전행, 열/2 값
        }
    }
    
    print(dp[n][m])
}
