// MARK: - 2446번
let N = Int(readLine()!)!

for i in 0..<N { // 위쪽 5줄
    var answer = ""
    
    for _ in 0..<i {
        answer += " "
    }
    
    for _ in 0..<2*(N-i)-1 {
        answer += "*"
    }
    
    print(answer)
}

for i in 0..<N-1 { // 아래쪽 4줄
    var answer = ""
    
    for _ in stride(from: N-2, to: i, by: -1) {
        answer += " "
    }
    
    for _ in 0..<2 * (i + 1) + 1 {
        answer += "*"
    }
    
    print(answer)
}
