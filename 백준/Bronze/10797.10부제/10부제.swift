// MARK: - 10797번(2)
let input = Int(readLine()!)!
let answer = readLine()!.split(separator: " ").filter{Int($0) == input}
print(answer.count)
