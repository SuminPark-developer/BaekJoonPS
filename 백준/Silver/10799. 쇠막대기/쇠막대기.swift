// 백준 - 10799번
let input = Array(readLine()!)
var stack = [Character]()
var count: Int = 0

for i in 0..<input.count {
    
    if input[i] == "(" {
        stack.append(input[i])
    }
    
    else { // input[i] == ")"
        if input[i - 1] == "(" {
            stack.popLast()
            count += stack.count
        }
        else { // input[i - 1] == ")"
            stack.popLast()
            count += 1
        }
    }
}

print(count)
