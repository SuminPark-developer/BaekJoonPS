// MARK: - 11660번(DP - 반복문)
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, M) = (input[0], input[1])
var arr: [[Int]] = Array(repeating: [], count: N + 1)
var dp = Array(repeating: Array(repeating: 0, count: N + 1), count: N + 1)

for _ in 0...N {
    arr[0].append(0)
}

for i in 1...N {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    arr[i] = [0] + input
}

for i in 1...N {
    for j in 1...N {
        dp[i][j] = dp[i][j - 1] + dp[i - 1][j] - dp[i - 1][j - 1] + arr[i][j]
    }
}
//print(dp)

for _ in 0..<M {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (x1, y1, x2, y2) = (input[0], input[1], input[2], input[3])
    
    let answer = dp[x2][y2] - dp[x2][y1 - 1] - dp[x1 - 1][y2] + dp[x1 - 1][y1 - 1]
    print(answer)
}
