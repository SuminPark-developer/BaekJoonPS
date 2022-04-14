// MARK: - 2748번(DP - 탑다운)
let n = Int(readLine()!)!
var cache = Array(repeating: -1, count: 91)
cache[0] = 0
cache[1] = 1

func fibo(_ num: Int) -> Int {
    if cache[num] == -1 {
        cache[num] = fibo(num - 1) + fibo(num - 2)
    }
    return cache[num]
}

let answer = fibo(n)
print(answer)
