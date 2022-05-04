// MARK: - 22869번(DP - 반복문)
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, K) = (input[0], input[1])
var arr: [Int] = [0] + readLine()!.split(separator: " ").map{Int(String($0))!}

var dp: [Int] = [0] + Array(repeating: 0, count: N)
dp[1] = 1 // 첫번째 돌은 이동가능이라 1로 표시.

var answer: String = "NO"
for i in 1..<N { // 첫번째 돌부터,
    if dp[i] == 1 { // 이동 가능한 곳만 체크.
        for j in i+1...N {
            let power = (j - i) * (1 + abs(arr[i] - arr[j]))
            if power <= K { // 이동가능하다면,
                dp[j] = 1 // 이동가능한곳 1로 표시.
            }
        }
        
        if dp[N] == 1 {
            answer = "YES"
            break
        }
    }
}
print(answer)
