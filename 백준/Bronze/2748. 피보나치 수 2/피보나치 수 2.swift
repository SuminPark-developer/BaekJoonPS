// MARK: - 2748번(DP - 바텀업)
let n = Int(readLine()!)!
var cache = Array(repeating: -1, count: n + 1)
cache[0] = 0
cache[1] = 1

if n >= 2 {
    for i in 2...n {
        cache[i] = cache[i - 1] + cache[i - 2]
    }
}
print(cache[n])
