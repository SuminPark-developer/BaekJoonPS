// MARK: - 15724번(DP - 반복문)
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, M) = (input[0], input[1])
var arr: [[Int]] = Array(repeating: [], count: N + 1)

for i in 1...N {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    arr[i] = [0] + input
}
arr[0] = Array(repeating: 0, count: M + 1)

var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: M + 1), count: N + 1)
for i in 1...N {
    for j in 1...M {
        dp[i][j] = dp[i][j - 1] + arr[i][j]
    }
}

let K = Int(readLine()!)!
for _ in 0..<K {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (x1, y1, x2, y2) = (input[0], input[1], input[2], input[3])
    
    var sum: Int = 0
    for x in x1...x2 {
        sum += dp[x][y2] - dp[x][y1 - 1]
    }
    print(sum)
}
