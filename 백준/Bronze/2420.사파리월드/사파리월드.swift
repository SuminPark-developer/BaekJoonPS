// MARK: - 2420번
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, M) = (input[0], input[1])

var answer = abs(N - M)
print(answer)
