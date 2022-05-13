// MARK: - 12865번(DP - 반복문)
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, K) = (input[0], input[1])
var bags: [(weight: Int, value: Int)] = [(0, 0)] // 인덱스0의 값은 0으로 공간메꾸기.
for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (W, V) = (input[0], input[1])
    bags.append((W, V))
}

var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: K + 1), count: N + 1)

for i in 1...N {
//    for j in stride(from: bags[i].weight, through: K, by: 1) { // 이렇게만 하면, 다음 행의 나머지 부분들의 값이 계속 유지되는게 아니라 0이 됨.
//        dp[i][j] = max(dp[i - 1][j], dp[i - 1][j - bags[i].weight] + bags[i].value)
//    }
    for j in 1...K { // 1부터 K까지 돌면서,
        if j >= bags[i].weight { // j - bags[i].weight가 인덱스의 범위를 벗어나지 않으면,
            dp[i][j] = max(dp[i - 1][j], dp[i - 1][j - bags[i].weight] + bags[i].value)
        }
        else { // j - bags[i].weight가 인덱스의 범위를 벗어나면,
            dp[i][j] = dp[i - 1][j]
        }
    }
}
print(dp[N][K])
