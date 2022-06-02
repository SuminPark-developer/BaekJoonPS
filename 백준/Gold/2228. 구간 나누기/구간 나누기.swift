// MARK: - 2228번(DP - TopDown)
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, M) = (input[0], input[1])
var arr: [Int] = [-32769]
for _ in 0..<N {
    arr.append(Int(readLine()!)!)
}
let initValue: Int = (-32768 * 100) - 1 // 최소값 -32768 * 최대 100개 -> 가능한 최소 누적합, 거기에 -1을 해야 불가능한 값이 됨.
var dp: [[Int]] = Array(repeating: Array(repeating: initValue, count: M + 1), count: N + 1)
var cumSum: [Int] = Array(repeating: 0, count: N + 1) // 누적합

for i in 1...N { // 누적합 저장.
    cumSum[i] = cumSum[i - 1] + arr[i]
}
//print(cumSum)
var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: M + 1), count: N + 1) // 방문체크.

func solve(_ index: Int, _ section: Int) -> Int { // 재귀함수
    if section == 0 {
        return 0
    }
    if index <= 0 { // index를 벗어날 땐,
        return initValue
    }
    
    if visited[index][section] { // 방문한 적이 있다면,
        return dp[index][section]
    }
    
    visited[index][section] = true // 방문 기록.
    dp[index][section] = solve(index - 1, section) // index번째수가 구간section에 속하지 않는 경우.
    
    for k in stride(from: index, through: 1, by: -1) {
        dp[index][section] = max(dp[index][section], solve(k - 2, section - 1) + (cumSum[index] - cumSum[k - 1]))
    }
        
    return dp[index][section]
}

let answer = solve(N, M)
print(answer)
