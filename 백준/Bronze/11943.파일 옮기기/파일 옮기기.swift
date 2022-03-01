// MARK: - 11943번
let basket1 = readLine()!.split(separator: " ").map{Int(String($0))!}
var (A, B) = (basket1[0], basket1[1])

let basket2 = readLine()!.split(separator: " ").map{Int(String($0))!}
var (C, D) = (basket2[0], basket2[1])

var answer: [Int] = []

// (basket1: 사과, basket2: 오렌지)일 때
answer.append(C + B)

// (basket1: 오렌지, basket2: 사과)일 때
answer.append(A + D)

print(answer.min()!)
