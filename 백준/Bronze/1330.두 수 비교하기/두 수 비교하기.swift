// MARK: - 1330번
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (A, B) = (input[0], input[1])

if A > B {
    print(">")
}
else if A < B {
    print("<")
}
else {
    print("==")
}
