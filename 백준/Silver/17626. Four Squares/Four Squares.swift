// MARK: - 17626번(DP - 반복문)
let n = Int(readLine()!)!
var cache = Array(repeating: -1, count: n + 1)
cache[0] = 0
cache[1] = 1

if n >= 2 {
    for i in 2...n {
        var minValue = 50001
        var j = 1
        while j * j <= i { // 제곱했을 때 i의 범위를 벗어나지 않을 때,
            minValue = min(minValue, cache[i - j * j]) // 이전 제곱수들 중
            j += 1
        }
        cache[i] = minValue + 1
//        print(cache)
    }
}
print(cache[n])
