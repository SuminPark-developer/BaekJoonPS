// MARK: - 2441번
let N = Int(readLine()!)!

for i in 0..<N {
    var answer = ""
    
    for _ in 0..<i {
        answer += " "
    }
    
    for _ in stride(from: N, to: i, by: -1) {
        answer += "*"
    }
    
    print(answer)
}
