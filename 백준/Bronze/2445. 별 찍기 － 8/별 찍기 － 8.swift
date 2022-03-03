// MARK: - 2445번
let N = Int(readLine()!)!

for i in 0..<N { // 윗쪽 5줄
    var answer = ""
    
    for _ in 0...i {
        answer += "*"
    }
    
    for _ in 0..<2*(N-i-1) {
        answer += " "
    }
    
    for _ in 0...i {
        answer += "*"
    }

    print(answer)
}

for i in 0..<N-1 { // 아래쪽 4줄
    var temp = ""
    
    for _ in 0..<N-i-1 {
        temp += "*"
    }
    
    for _ in 0..<2*(i+1) {
        temp += " "
    }
    
    for _ in 0..<N-i-1 {
        temp += "*"
    }
    
    print(temp)
}
