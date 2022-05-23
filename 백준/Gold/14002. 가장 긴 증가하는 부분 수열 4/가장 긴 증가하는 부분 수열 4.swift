// MARK: - 14002번(DP - 반복문 / LIS - 이중반복문)
let N = Int(readLine()!)!
var arr: [Int] = readLine()!.split(separator: " ").map{Int(String($0))!}
var dp: [Int] = Array(repeating: 1, count: N)

for i in 1..<N {
    for j in 0..<i {
        if arr[j] < arr[i] {
            dp[i] = max(dp[i], dp[j] + 1)
        }
    }
}

var standard: Int = dp.max()!
print(standard) // LIS의 길이 출력.
var temp: [Int] = []

for i in stride(from: N - 1, through: 0, by: -1) { // dp를 뒤에서부터 돌면서,
    if dp[i] == standard { // 기준 : 최대값부터 1까지
        temp.append(arr[i])
        standard -= 1
    }
}

let answer: [Int] = temp.reversed()
for num in answer {
    print(num, terminator: " ")
}
