// MARK: - 1010번(DP - topDown)
let T = Int(readLine()!)!

for _ in 0..<T {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (N, M) = (input[0], input[1])
    
    var cache = Array(repeating: Array(repeating: -1, count: 30), count: 30)
    func bino(_ m: Int, _ n: Int) -> Int { // 이항계수
        if cache[m][n] != -1 {
            return cache[m][n]
        }
        
        if n == 0 || n == m { // mC0 이나 mCm일 때,
            cache[m][n] = 1
        }
        else { // n이 1 ~ m-1일 땐,
            cache[m][n] = bino(m - 1, n - 1) + bino(m - 1, n)
        }
        
        return cache[m][n]
    }
    let answer = bino(M, N)
    print(answer)
}
