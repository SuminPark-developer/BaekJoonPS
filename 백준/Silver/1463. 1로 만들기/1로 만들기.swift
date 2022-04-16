// MARK: - 1463번(DP - 반복문)
let N = Int(readLine()!)!
var cache = Array(repeating: -1, count: 1000001)
cache[1] = 0
cache[2] = 1
cache[3] = 1

if N >= 4 {
    for i in 4...N {
        if i % 3 == 0 && i % 2 == 0 { // 6의 배수일 때 -> (/3 연산, /2 연산, -1연산) 중 작은 값 + 1
            cache[i] = min(cache[i / 3], cache[i / 2], cache[i - 1]) + 1
        }
        else if i % 3 == 0 { // 3의 배수일 때 -> (/3 연산, -1연산) 중 작은 값 + 1
            cache[i] = min(cache[i / 3], cache[i - 1]) + 1
        }
        else if i % 2 == 0 { // 2의 배수일 때 -> (/2 연산, -1연산) 중 작은 값 + 1
            cache[i] = min(cache[i / 2], cache[i - 1]) + 1
        }
        else { // 다 해당되지 않으면, -1연산 값 + 1
            cache[i] = cache[i - 1] + 1
        }
    }
}
print(cache[N])
