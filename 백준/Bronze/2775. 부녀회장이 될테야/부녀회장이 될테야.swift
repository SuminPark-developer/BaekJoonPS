// MARK: - 2775번(1) - 재귀함수
let T = Int(readLine()!)!

func getCitizen(_ k: Int, _ n: Int) -> Int {
    if k == 0 || n == 1 {
        return n
    }
    
    return getCitizen(k - 1, n) + getCitizen(k, n - 1) // (k-1층의 n호), (k층의 n-1호)
}

for _ in 0..<T {
    let k = Int(readLine()!)!
    let n = Int(readLine()!)!
    
    print(getCitizen(k, n))
}
