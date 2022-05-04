// MARK: - 1106번(DP - 반복문)
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (C, N) = (input[0], input[1])
var ad: [(cost: Int, customer: Int)] = [(0, 0)]

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    ad.append((input[0], input[1]))
}

var dp: [Int] = [0] + Array(repeating: Int.max - 100, count: C + 100) // 비용이 최대 100이기 때문에, 최대값 - 100을 해줘야 계산이 가능해진다.
//var dp: [Int] = [0] + Array(repeating: 10000, count: C + 100)

for (cost, customer) in ad {
    for i in customer...(C+100) {
        dp[i] = min(dp[i], dp[i - customer] + cost)
    }
}

let answer = dp[C...C+100].min()!
print(answer)
