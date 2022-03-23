// 백준 - 3986번
let N = Int(readLine()!)!
var count: Int = 0

for _ in 0..<N {
    var stack: [Character] = [Character]()
    let input = readLine()!
    
    for ch in input {
        if stack.isEmpty {
            stack.append(ch)
        }
        else {
            if stack.last! == ch {
                stack.popLast()
            }
            else {
                stack.append(ch)
            }
        }
    }
    
    if stack.isEmpty {
        count += 1
    }
    
}

print(count)
