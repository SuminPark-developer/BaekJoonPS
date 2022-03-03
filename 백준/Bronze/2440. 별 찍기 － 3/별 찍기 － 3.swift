// MARK: - 2440번
let N = Int(readLine()!)!

for i in 0..<N {
    var answer = ""
    for _ in stride(from: N, to: i, by: -1) {
        answer += "*"
    }

    print(answer)
}

