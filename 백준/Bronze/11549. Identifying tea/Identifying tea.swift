// MARK: - 11549번
let T = Int(readLine()!)!
let answer = readLine()!.split(separator: " ").map{Int(String($0))!}.filter{$0 == T}.count

print(answer)
