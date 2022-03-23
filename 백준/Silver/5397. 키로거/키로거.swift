// MARK: - 5397번
let T = Int(readLine()!)!

for _ in 0..<T {
    let input = readLine()!.map{String($0)}
    var stack1: [String] = []
    var stack2: [String] = []
    
    for ch in input {
        if ch == "<" {
            if !stack1.isEmpty {
                stack2.append(stack1.popLast()!)
            }
        }
        else if ch == ">" {
            if !stack2.isEmpty {
                stack1.append(stack2.popLast()!)
            }
        }
        else if ch == "-" {
            if !stack1.isEmpty {
                stack1.removeLast()
            }
        }
        else { // 알파벳일 때,
            stack1.append(ch)
        }
    }
    
    let answer = stack1 + stack2.reversed()
    print(answer.joined(separator: ""))
    
}
