// MARK: - 1434번
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, M) = (input[0], input[1])

let A = readLine()!.split(separator: " ").map{Int(String($0))!}
let B = readLine()!.split(separator: " ").map{Int(String($0))!}

let aSum = A.reduce(0, +)
let bSum = B.reduce(0, +)

print(aSum - bSum)
