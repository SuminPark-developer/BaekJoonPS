// MARK: - 15963번
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, M) = (input[0], input[1])

if N == M {
    print("1")
}
else {
    print("0")
}
