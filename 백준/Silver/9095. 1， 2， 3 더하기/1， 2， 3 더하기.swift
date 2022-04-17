// MARK: - 9095번(DP - 반복문)
let T = Int(readLine()!)!
var cache = Array(repeating: -1, count: 11)
cache[1] = 1
cache[2] = 2
cache[3] = 4

for _ in 0..<T {
    let n = Int(readLine()!)!
    
    if n >= 4 { // 4부터 점화식 성립.
        for i in 4...n {
            cache[i] = cache[i - 1] + cache[i - 2] + cache[i - 3]
        }
    }
    
    print(cache[n])
}
