// MARK: - 16756번
let N = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
var minArray: [Int] = []

for i in 0..<N-1 {
    minArray.append(abs(input[i + 1] - input[i]))
}

print(minArray.min()!)
