// MARK: - 2935번
let A = readLine()!.count
let oper = readLine()!
let B = readLine()!.count

var result = "1"

if oper == "*" { // *일 때,
    result += String(repeating: "0", count: A - 1) + String(repeating: "0", count: B - 1)
}
else { // +일 때,
    if A > B {
        result += String(repeating: "0", count: A - B - 1) + "1" + String(repeating: "0", count: B - 1)
    }
    else if A < B {
        result += String(repeating: "0", count: B - A - 1) + "1" + String(repeating: "0", count: A - 1)
    }
    else {
        result = "2" + String(repeating: "0", count: A - 1)
    }
}

print(result)
