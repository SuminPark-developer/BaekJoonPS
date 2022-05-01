// MARK: - 2294번(DP - 반복문)
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (n, k) = (input[0], input[1])
var coins: [Int] = []
for _ in 0..<n {
    coins.append(Int(readLine()!)!)
}
coins.sort(by: <)

var dp: [Int] = [0] + Array(repeating: 10001, count: k) // k의 최대값이 10000이기 때문에. (최대한 개수가 많게 1원짜리로해도 dp값의 최대는 10000이기 때문에.)

for coin in coins {
    for j in 1...k {
        if j - coin < 0 { // dp의 인덱스를 벗어나면 패스.
            continue
        }
        dp[j] = min(dp[j], dp[j - coin] + 1)
    }
}

if dp[k] == 10001 {
    print(-1)
}
else {
    print(dp[k])
}
