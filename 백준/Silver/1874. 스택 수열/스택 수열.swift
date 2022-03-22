// MARK: - 1874번(풀이2)
let N = Int(readLine()!)!
var numArray: [Int] = []
for _ in 0..<N {
    numArray.append(Int(readLine()!)!)
}

var stack: [Int] = []
var operatorArray: [String] = []
var index: Int = 0

for i in 1...N {
    stack.append(i)
    operatorArray.append("+")
    
    while !stack.isEmpty && stack.last! == numArray[index] { // stack이 비어있지 않고, 스택의 마지막이 pop을 해야하는 정수면,
        stack.removeLast()
        index += 1
        operatorArray.append("-")
    }
    
}

if !stack.isEmpty {
    print("NO")
}
else {
    for op in operatorArray {
        print(op)
    }
}
