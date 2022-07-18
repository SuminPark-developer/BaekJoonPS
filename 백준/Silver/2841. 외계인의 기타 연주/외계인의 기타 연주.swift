// MARK: - 2841번(Stack)
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, P) = (input[0], input[1])
var stacks: [[Int]] = Array(repeating: [], count: N + 1)
var count: Int = 0

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (line, fret) = (input[0], input[1])
    
    while true {
        if stacks[line].isEmpty {
            stacks[line].append(fret)
            count += 1
            break
        }
        
        if stacks[line].last! > fret {
            stacks[line].removeLast()
            count += 1
        }
        else if stacks[line].last! == fret {
            break
        }
        else {
            stacks[line].append(fret)
            count += 1
            break
        }
    }
}
print(count)
