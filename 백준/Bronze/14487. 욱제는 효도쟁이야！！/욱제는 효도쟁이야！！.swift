// MARK: - 14487번
let n = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let answer = input.reduce(0, +) - input.max()!

print(answer)
