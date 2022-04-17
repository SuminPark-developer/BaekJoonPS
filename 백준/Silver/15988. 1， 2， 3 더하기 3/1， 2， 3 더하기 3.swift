// MARK: - 15988번(DP - 반복문)
let T = Int(readLine()!)!
var cache = Array(repeating: -1, count: 1000001)
cache[1] = 1
cache[2] = 2
cache[3] = 4

for i in 4...1000000 { // 4부터 점화식 성립.
    cache[i] = (cache[i - 1] + cache[i - 2] + cache[i - 3]) % 1000000009
}

for _ in 0..<T {
    let n = Int(readLine()!)!
    print(cache[n])
}
