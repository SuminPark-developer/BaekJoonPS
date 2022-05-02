// MARK: - 21317번(DP - 반복문)
let N = Int(readLine()!)!
var smallJ: [Int] = [0] + Array(repeating: 0, count: N - 1)
var bigJ: [Int] = [0] + Array(repeating: 0, count: N - 1)
var dp: [[Int]] = Array(repeating: Array(repeating: 5001, count: 2), count: N + 1)
dp[0][0] = 0
dp[0][1] = 0
dp[1][0] = 0
dp[1][1] = 0

for i in 1..<N {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (smallEnergy, bigEnergy) = (input[0], input[1])
    smallJ[i] = smallEnergy
    bigJ[i] = bigEnergy
}

let k: Int = Int(readLine()!)!

if N == 2 {
    dp[2][0] = smallJ[1]
}
else if N == 3 {
    dp[2][0] = smallJ[1]
    dp[3][0] = min(dp[2][0] + smallJ[2], bigJ[1])
}
else if N >= 4 {
    dp[2][0] = smallJ[1]
    dp[3][0] = min(dp[2][0] + smallJ[2], bigJ[1])
    
    for i in 4...N {
        dp[i][0] = min(dp[i - 1][0] + smallJ[i - 1], dp[i - 2][0] + bigJ[i - 2]) // k를 사용하지 않을 때.
        dp[i][1] = min((dp[i - 3][0] + k), (dp[i - 1][1] + smallJ[i - 1]), (dp[i - 2][1] + bigJ[i - 2])) // k를 사용할 때.
    }
}

//print(dp)
print(dp[N].min()!)
