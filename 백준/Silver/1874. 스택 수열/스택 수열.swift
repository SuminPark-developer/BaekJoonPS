// MARK: - 1874번
let N = Int(readLine()!)!

var stack: [Int] = []
var op: [String] = []
var num: Int = 1
for _ in 0..<N {
    let input = Int(readLine()!)!
    
    while num <= input {
        stack.append(num)
        op.append("+")
        num += 1
    }
    
    if stack.last! == input {
        stack.removeLast()
        op.append("-")
    }
    else {
        op.append("NO")
        break
    }
}

if op.contains("NO") {
    print("NO")
}
else {
    for o in op { // operator 출력.
        print(o)
    }
}
