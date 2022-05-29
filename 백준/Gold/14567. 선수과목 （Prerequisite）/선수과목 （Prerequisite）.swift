// MARK: - 14567번(DP - 반복문)
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, M) = (input[0], input[1])
var arr: [(from: Int, to: Int)] = []
for _ in 0..<M {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    arr.append((input[0], input[1]))
}
arr.sort(by: <) // from기준 오름차순 정렬

var dp: [Int] = Array(repeating: 1, count: N + 1)
dp[0] = 0
for line in arr {
    dp[line.to] = max(dp[line.to], dp[line.from] + 1)
}

print(dp[1...N].map{String($0)}.joined(separator: " "))
