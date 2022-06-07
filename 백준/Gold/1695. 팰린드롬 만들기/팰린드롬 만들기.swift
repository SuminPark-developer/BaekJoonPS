// MARK: - 1695번(DP - 반복문)
let N = Int(readLine()!)!
var arr: [Int] = [-1] + readLine()!.split(separator: " ").map{Int(String($0))!}
//var rArr = arr.reversed() // arr을 뒤집음.

var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: N + 1), count: N + 1)

for i in 1...N { // 뒤부터 돈 것(rArr)과,
    for j in 1...N { // 앞부터 돈 것(arr)에서,
        if arr[N + 1 - i] == arr[j] { // 숫자가 같다면,
            dp[i][j] = dp[i - 1][j - 1] + 1
        }
        else { // 숫자가 다르다면,
            dp[i][j] = max(dp[i - 1][j], dp[i][j - 1]) // 이전 행의 같은 열, 같은 행의 이전 열 중 큰 값을 저장.
        }
    }
}

print(N - dp[N][N])
