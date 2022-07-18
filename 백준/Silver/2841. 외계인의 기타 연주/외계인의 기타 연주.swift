// MARK: - 2841번(Stack)
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, P) = (input[0], input[1])
var stacks: [[Int]] = Array(repeating: [], count: N + 1)
var count: Int = 0

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (line, fret) = (input[0], input[1])
    
    while true {
        if stacks[line].isEmpty { // 그 줄의 스택이 비었으면,
            stacks[line].append(fret) // 넣고 끝.
            count += 1
            break
        }
        
        if stacks[line].last! > fret { // 새로 들어온 프렛이 더 작으면, 그 줄의 스택에서 하나씩 빼냄.
            stacks[line].removeLast()
            count += 1
        }
        else if stacks[line].last! == fret { // 같으면, 멈춤.
            break
        }
        else { // 새로 들어온 프렛이 더 커지는 순간이 오면, 그 줄의 스택에 넣고 멈춤.
            stacks[line].append(fret)
            count += 1
            break
        }
    }
}
print(count)
