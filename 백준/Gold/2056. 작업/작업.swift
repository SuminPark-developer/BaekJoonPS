// MARK: - 2056번(DP - 반복문)
let N = Int(readLine()!)!
var dp: [Int] = [-1] + Array(repeating: 0, count: N)

for i in 1...N { // 작업을 돌면서,
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let time = input[0] // i번 작업에 걸리는 시간.
    let count: Int = input[1] // 선행 관계에 있는 작업 개수
    
    dp[i] = time // i번 작업에 걸리는 시간을 우선 저장.
    
    for j in 0..<count { // 선행 관계를 돌면서,
        let beforeWorkNum = input[2 + j] // 선행 관계 작업 번호
        dp[i] = max(dp[i], dp[beforeWorkNum] + time)
    }
}

print(dp.max()!)
