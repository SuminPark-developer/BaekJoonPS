// MARK: - 2565번(DP - 반복문 / LIS - 이중반복문)
let N = Int(readLine()!)!
var arr: [(A: Int, B: Int)] = []
for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    arr.append((input[0], input[1]))
}

arr.sort(by: <) // A기준으로, 오름차순 정렬.

var dp: [Int] = Array(repeating: 1, count: N)

for i in 1..<N {
    for j in 0..<i {
        if arr[j].B < arr[i].B {
            dp[i] = max(dp[i], dp[j] + 1)
        }
    }
}

let answer: Int = N - dp.max()!
print(answer)
