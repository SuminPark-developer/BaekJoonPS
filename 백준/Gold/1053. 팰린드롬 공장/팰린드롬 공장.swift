// MARK: - 1053번(DP, 팰린드롬)
var arr: [String] = readLine()!.map{String($0)}
let N: Int = arr.count

func findMin(_ start: Int, _ end: Int) -> Int {
    var dp = Array(repeating: Array(repeating: -1, count: N), count: N)
    arr.swapAt(start, end) // 방법4 사용.
    
    // 기본 세팅1.
    for i in 0..<N {
        dp[i][i] = 0
    }
    // 기본 세팅2.
    for i in 0..<N-1 {
        if arr[i] == arr[i + 1] { // 같으면,
            dp[i][i + 1] = 0 // 방법 사용할 필요 없으니 0.
        }
        else { // 다르면,
            dp[i][i + 1] = 1 // 방법1 사용.
        }
    }
    
    for i in stride(from: N - 2, through: 0, by: -1) {
        for j in i+2..<N {
            if arr[i] == arr[j] { // 방법3 사용.
                dp[i][j] = dp[i + 1][j - 1]
            }
            else { // 방법3 사용.
                dp[i][j] = dp[i + 1][j - 1] + 1
            }
            dp[i][j] = min(dp[i][j], dp[i][j - 1] + 1, dp[i + 1][j] + 1) // 방법3, 방법1, 방법2 중 가장 작은 값 저장.
        }
    }
    
    return dp[0][N - 1]
}

var answer: Int = findMin(0, 0) // 방법4를 사용하지 않고, 방법1,2,3만을 이용해서 팰린드롬을 만드는데 필요한 횟수.

for i in 0..<N {
    for j in i+1..<N {
        let temp = findMin(i, j) + 1 // +1인 이유는, 방법4를 쓴 횟수 더해줌.
        answer = min(answer, temp)
        arr.swapAt(i, j)
    }
}
print(answer)
