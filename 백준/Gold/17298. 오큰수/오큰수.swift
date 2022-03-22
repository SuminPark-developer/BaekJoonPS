// MARK: - 17298번
let N = Int(readLine()!)!
var array = readLine()!.split(separator: " ").map{Int(String($0))!}
var stack: [Int] = [] // 오큰수가 아닌 수의 index를 저장.

for i in 0..<N {
    
    while !stack.isEmpty && (array[stack.last!] < array[i]) {
        array[stack.popLast()!] = array[i]
    }
    
    stack.append(i)
    
}

for index in stack { // 여전히 stack에 남아 있는 index는 오큰수 없음.
    array[index] = -1
}

//for num in array { // 이렇게 출력하면 시간초과
//    print(num, terminator: " ")
//}

print(array.map{String($0)}.joined(separator: " "))
