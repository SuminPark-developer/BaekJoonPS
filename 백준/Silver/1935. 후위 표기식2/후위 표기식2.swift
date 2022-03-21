// 백준 - 1935번
import Foundation

let N = Int(readLine()!)!
let input = readLine()! // 식

var num = [Double]() // 숫자들 모음
for _ in 0..<N {
    num.append(Double(readLine()!)!)
}

var stack = [Double]()
for ch in input {
    
    if ch.isUppercase {
        stack.append(num[Int(ch.asciiValue!) - Int(Character("A").asciiValue!)]) // num[0...] 해당하는 값들 넣음.
        continue
    }
    
    let back: Double = stack.popLast()!
    let front: Double = stack.popLast()!
    
    if ch == "+" {
        stack.append(front + back)
    }
    else if ch == "-" {
        stack.append(front - back)
    }
    else if ch == "*" {
        stack.append(front * back)
    }
    else if ch == "/" {
        stack.append(front / back)
    }
}

let result: String = String(format: "%.2f", stack.first!)
print(result)
