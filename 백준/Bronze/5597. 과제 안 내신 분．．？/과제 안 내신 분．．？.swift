// MARK: - 5597번
var students: [Int] = [-1] + Array(repeating: 0, count: 30)

for _ in 0..<28 {
    let N = Int(readLine()!)!
    students[N] = 1
}

for (index, attendance) in students.enumerated() {
    if attendance == 0 {
        print(index)
    }
}
