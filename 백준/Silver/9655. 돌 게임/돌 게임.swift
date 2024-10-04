// MARK: - 9655번
let N = Int(readLine()!)!
var cache = Array(repeating: -1, count: 1001) // 게임한 횟수
cache[1] = 1
cache[2] = 2
cache[3] = 1

if N >= 4 {
    for i in 4...N {
        cache[i] = min(cache[i - 1], cache[i - 3]) + 1
    }
}

if cache[N] % 2 == 1 { // 게임한 횟수가 홀수면 '상근'
    print("SK")
}
else { // 짝수면 '창영'
    print("CY")
}
