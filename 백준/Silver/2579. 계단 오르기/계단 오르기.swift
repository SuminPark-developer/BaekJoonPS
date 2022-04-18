// MARK: - 2579번(DP - 반복문)
let T = Int(readLine()!)!
var stairs = Array(repeating: 0, count: 301)

for i in 1...T {
    let input = Int(readLine()!)!
    stairs[i] = input
}

var cache = Array(repeating: -1, count: 301)
cache[1] = stairs[1]
cache[2] = stairs[1] + stairs[2]
cache[3] = max(stairs[1] + stairs[3], stairs[2] + stairs[3])

if T >= 4 {
    for i in 4...T {
        cache[i] = max((cache[i - 3] + stairs[i - 1] + stairs[i]), (cache[i - 2] + stairs[i]))
    }

}
print(cache[T])
