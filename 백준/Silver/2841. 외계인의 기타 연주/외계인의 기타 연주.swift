// MARK: - 2841번
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, P) = (input[0], input[1])
var lineStack = Array(repeating: Array(repeating: 0, count: 0), count: 7)
var answer: Int = 0

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (line, fret) = (input[0], input[1])
    
    if lineStack[line].isEmpty { // 그 줄의 스택이 비었으면,
        lineStack[line].append(fret)
        answer += 1
    }
    else {
        if lineStack[line].last! < fret { // 새로운 프렛이 더 크면,
            lineStack[line].append(fret)
            answer += 1
        }
        else { // 새로운 프렛이 작은게 들어오면,
            while !lineStack[line].isEmpty && lineStack[line].last! > fret { // 새로운 프렛이 더 커질 때까지,
                lineStack[line].removeLast()
                answer += 1
            }
            if lineStack[line].isEmpty || lineStack[line].last! != fret { // 스택이 비었거나, 프렛이 마지막과 다를때만 넣음.(같을땐 패스.)
                lineStack[line].append(fret) // 새로운 프렛 스택에 추가.
                answer += 1
            }
            
        }
    }
//    print("\(i)번째, 값 : \(answer)")
}


print(answer)
