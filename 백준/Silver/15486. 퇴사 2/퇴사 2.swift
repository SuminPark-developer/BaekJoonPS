// MARK: - 15486번(DP - 반복문)
let N = Int(readLine()!)!
var T: [Int] = [0] + Array(repeating: 0, count: N) // 0일 제외
var P: [Int] = [0] + Array(repeating: 0, count: N) // 0일 제외

for i in 1...N {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (time, pay) = (input[0], input[1])
    T[i] = time
    P[i] = pay
}

var dp: [Int] = [0] + Array(repeating: 0, count: N) + [0] // 0일 제외, N개 + 1개(마지막날의 T값이 1일 땐 근무 가능. -> 그 값을 저장하기 위해 배열 1 증가시킴.)
var maxValue: Int = -1

for i in 1...N {
    let next = i + T[i]
    maxValue = max(maxValue, dp[i]) // 이전까지의 최대값을 계속 갖고 있어야 함.
    
    if next <= N + 1 {
//        dp[next] = max(dp[next], dp[i] + P[i])
        dp[next] = max(dp[next], maxValue + P[i]) // dp[i]가 아니라 maxValue여야 됨. 예제4에서 틀려서 확인.
    }
}

print(dp.max()!)
