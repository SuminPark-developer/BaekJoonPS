// MARK: - 2293번(DP - 반복문)
import Foundation
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (n, k) = (input[0], input[1])
var coins: [Int] = []

for _ in 0..<n {
    coins.append(Int(readLine()!)!)
}
var dp: [Int] = [1] + Array(repeating: 0, count: k) // dp[0] = 1

for coin in coins {
    if coin > k { // 동전의 가치가 합k보다 클 때, 에러를 방지하기 위해.
        continue
    }
    
    for i in coin...k {
        if dp[i] + dp[i - coin] > Int(pow(2.0, 31.0)) { // 경우의 수가 2^31을 벗어나는 경우, 에러를 방지하기 위해.
            dp[i] = 0
        }
        else {
            dp[i] = dp[i] + dp[i - coin]
        }
    }
}

print(dp[k])
