// MARK: - 11051번(TopDown)
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, K) = (input[0], input[1])
var cache = Array(repeating: Array(repeating: -1, count: K + 1), count: N + 1)

func bino(_ n: Int, _ k: Int) -> Int {
    if cache[n][k] != -1 {
        return cache[n][k]
    }
    if k == 0 || k == n {
        cache[n][k] = 1
    }
    else {
        cache[n][k] = (bino(n - 1, k - 1) + bino(n - 1, k)) % 10007
    }
    return cache[n][k]
}
let answer = bino(N, K)
print(answer)
