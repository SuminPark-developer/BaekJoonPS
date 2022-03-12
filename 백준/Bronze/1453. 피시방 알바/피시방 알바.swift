// MARK: - 1453번
let N = Int(readLine()!)!
var seat = Array(repeating: 0, count: 101) // 1번부터 100번까지
var answer: Int = 0
let input = readLine()!.split(separator: " ").map{Int(String($0))!}

for i in input {
    seat[i] += 1
}

for people in seat {
    if people >= 2 {
        answer += people - 1
    }
}

print(answer)
