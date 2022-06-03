// MARK: - 2073번(DP - 반복문)
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (D, P) = (input[0], input[1])
var pipes: [(length: Int, capacity: Int)] = []
for _ in 0..<P {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    pipes.append((input[0], input[1])) // L, C 저장.
}
pipes.sort(by: <) // 오름차순 정렬 - 할 필요는 없음. dp값 확인 용이하게 하려고 정렬.

var dp: [Int] = [Int.max] + Array(repeating: 0, count: D) // dp[0]에 매우 큰 값을 넣어놔야, min비교할 때 정상적으로 작동함. 0이나 음수, 다른 값을 넣으면 꼬임.

for pipe in pipes {
    
    for i in stride(from: D, through: 1, by: -1) {
        if i - pipe.length >= 0 {
            dp[i] = max(dp[i], min(pipe.capacity, dp[i - pipe.length]))
        }
    }
//    print(dp)
}

print(dp[D])
