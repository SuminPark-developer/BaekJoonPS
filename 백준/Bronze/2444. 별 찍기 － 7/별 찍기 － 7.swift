// MARK: - 2444번
let N = Int(readLine()!)!

for i in 0..<N { // 위쪽 5칸
    var answer = ""
    
    for _ in stride(from: N-i-1, to: 0, by: -1) {
        answer += " "
    }
    
    for _ in 0..<2 * i + 1 {
        answer += "*"
    }
    
    print(answer)
}

for i in 0..<N-1 { // 아래쪽 4칸
    var temp = ""
    
    for _ in 0...i {
        temp += " "
    }
    
    for _ in stride(from: 2*(N-1)-2*i-1, to: 0, by: -1) {
        temp += "*"
    }
    
    print(temp)
}
