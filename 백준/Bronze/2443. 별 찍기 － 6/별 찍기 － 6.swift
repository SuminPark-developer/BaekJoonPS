// MARK: - 2443번
let N = Int(readLine()!)!

for i in 0..<N {
    var answer = ""
    
    for _ in 0..<i {
        answer += " "
    }
    
    for _ in 0..<(2 * N) - (2*i + 1) {
        answer += "*"
    }
    
    print(answer)
}
