// MARK: - 2442번
let N = Int(readLine()!)!

for i in 0..<N {
    var answer = ""
    
    for _ in stride(from: N - 1, to: i, by: -1) {
        answer += " "
    }
    
    for _ in 0..<(2 * i + 1) {
        answer += "*"
    }
    print(answer)
}
