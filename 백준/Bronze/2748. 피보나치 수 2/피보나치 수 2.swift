// MARK: - 2748번(DP - 반복문)
let n = Int(readLine()!)!
var cache = Array(repeating: -1, count: 91)
cache[0] = 0
cache[1] = 1

if n >= 2 {
    for i in 2...n {
        cache[i] = cache[i - 2] + cache[i - 1]
    }
}
print(cache[n])
