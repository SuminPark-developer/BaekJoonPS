// MARK: - 11659번
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, M) = (input[0], input[1])
var arr: [Int] = [0] + readLine()!.split(separator: " ").map{Int(String($0))!}
var dp: [Int] = [0] + Array(repeating: 0, count: N)

for i in 1...N {
    dp[i] = dp[i - 1] + arr[i]
}
//print(dp)

for _ in 0..<M {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (from, through) = (input[0], input[1])
    
    let answer = dp[through] - dp[from - 1]
    print(answer)
}
