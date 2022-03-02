// MARK: - 19944번
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, M) = (input[0], input[1])

if M == 1 || M == 2 {
    print("NEWBIE!")
}
else if M <= N {
    print("OLDBIE!")
}
else {
    print("TLE!")
}
