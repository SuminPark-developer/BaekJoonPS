// MARK: - 10162번
let T = Int(readLine()!)!
var (countA, countB, countC) = (0, 0, 0)

if T % 10 != 0 {
    print("-1")
}
else {
    countA = T / 300
    countB = (T % 300) / 60
    countC = ((T % 300) % 60) / 10
    print("\(countA) \(countB) \(countC)")
}
