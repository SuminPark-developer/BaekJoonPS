// MARK: - 2624번(DP - 반복문)
let T = Int(readLine()!)!
let K = Int(readLine()!)!
var coins: [[Int]] = [[0, 0]] // [0, 0]은 인덱스 채우기용.
for _ in 0..<K {
    coins.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}
coins.sort{$0[0] < $1[0]} // 동전금액기준 오름차순 정렬. (2차원배열 sort - https://stackoverflow.com/questions/31088974/use-sort-for-multidimensional-array-array-in-array-in-swift)

var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: T + 1), count: K + 1)

for i in 0...K { // 초기값 세팅.
    dp[i][0] = 1 // 0원 만드는 경우는 1가지.
}

for i in 1...K {
    let (currCoin, currCnt) = (coins[i][0], coins[i][1]) // (현재 코인, 현재 코인의 사용 가능한 개수)
    for j in 1...T {
        if j < currCoin { // 현재 비교할 코인보다 작은 인덱스일 땐,
            dp[i][j] = dp[i - 1][j] // 지난번 값 그대로 저장.
            continue
        }
        for k in 0...currCnt { // 현재 코인의 사용가능한 개수까지 사용하면서, (현재 코인 | 0개 사용일 때, 1개 사용일 때, ... currCnt개 사용일 때)
            if j - k * currCoin >= 0 { // 인덱스를 벗어나지 않는 경우에만,
                dp[i][j] += dp[i - 1][j - k * currCoin]
            }
        }
    }
}

print(dp[K][T])
