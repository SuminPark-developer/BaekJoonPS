// MARK: - 1406번(stack사용)
var stackL = readLine()!.map{String($0)}
var stackR: [String] = []

let M = Int(readLine()!)!

for _ in 0..<M {
    let input = readLine()!
    // .split이 시간을 잡아 먹음.
//    var (command, char) = ("", "")
//    if input.contains(" ") { // 문자 입력(P)이면,
//        let temp = input.split(separator: " ").map{String($0)}
//        (command, char) = (temp[0], temp[1])
//    }
//    else { // L, D, B 이면,
//        command = input
//    }
    
    switch input {
    case "L":
        if !stackL.isEmpty {
            stackR.append(stackL.popLast()!)
        }
    case "D":
        if !stackR.isEmpty {
            stackL.append(stackR.popLast()!)
        }
    case "B":
        if !stackL.isEmpty {
            stackL.removeLast()
        }
    default: // P일 때,
        stackL.append(String(input.last!))
    }
    
}

let answer = stackL + stackR.reversed()
print(answer.joined(separator: ""))
