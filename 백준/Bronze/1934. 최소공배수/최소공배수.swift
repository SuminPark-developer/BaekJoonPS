// MARK: - 1934번
let T = Int(readLine()!)!

for _ in 0..<T {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted(by: >)
    let (A, B) = (input[0], input[1])
    
    print(lcm(A, B))
}


func gcd(_ a: Int, _ b: Int) -> Int {
    return b == 0 ? a : gcd(b, a % b)
}

func lcm(_ a: Int, _ b: Int) -> Int {
    return a * b / gcd(a, b)
}
