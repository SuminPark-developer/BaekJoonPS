// MARK: - 16204번
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, M, K) = (input[0], input[1], input[2])

let countO = min(M, K)
let countX = min(N - M, N - K)

print(countO + countX)
