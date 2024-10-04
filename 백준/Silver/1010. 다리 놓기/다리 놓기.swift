// MARK: - 1010번(BottomUp)
let T = Int(readLine()!)!
var cache = Array(repeating: Array(repeating: -1, count: 30), count: 30)

for j in 1..<30 {
    for i in 0...j {
        if i == 0 || i == j {
            cache[j][i] = 1
        }
        else {
            cache[j][i] = cache[j - 1][i - 1] + cache[j - 1][i]
        }
    }
}

for _ in 0..<T {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (N, M) = (input[0], input[1])
    print(cache[M][N]) // mCn
}
