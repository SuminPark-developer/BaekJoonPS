// MARK: - 2609번
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (a, b) = (input.max()!, input.min()!)

func gcd(_ a: Int, _ b: Int) -> Int {
    return b == 0 ? a : gcd(b, a % b)
}

func lcm(_ a: Int, _ b: Int) -> Int {
    return a * b / gcd(a, b)
}

let gcdResult = gcd(a, b)
let lcmResult = lcm(a, b)

print(gcdResult)
print(lcmResult)
