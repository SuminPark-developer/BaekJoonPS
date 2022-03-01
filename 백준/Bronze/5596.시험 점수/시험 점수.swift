// MARK: - 5596번
let S = readLine()!.split(separator: " ").map{Int(String($0))!}.reduce(0, +)
let T = readLine()!.split(separator: " ").map{Int(String($0))!}.reduce(0, +)

if S >= T {
    print(S)
}
else {
    print(T)
}
