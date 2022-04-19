// MARK: - 11727번(DP - 반복문)
let n = Int(readLine()!)!
var cache = Array(repeating: -1, count: 1001)
cache[1] = 1
cache[2] = 3

if n >= 3 {
    for i in 3...n {
        cache[i] = (2 * cache[i - 2] + cache[i - 1]) % 10007
    }
}

print(cache[n])
