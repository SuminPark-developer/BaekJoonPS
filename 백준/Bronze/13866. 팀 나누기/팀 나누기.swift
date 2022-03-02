// MARK: - 13866번
var input = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted(by: <)
let sum1: Int = input[0] + input[3]
let sum2: Int = input[1] + input[2]

print(abs(sum1 - sum2))
