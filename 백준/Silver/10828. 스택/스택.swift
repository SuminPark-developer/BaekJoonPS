// MARK: - 10828번
let N = Int(readLine()!)!

var answerArray: [String] = []
for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map{String($0)}
    
    if input[0] == "push" {
        answerArray.append(input[1])
    }
    else {
        switch input[0] {
        case "pop":
            if let lastValue = answerArray.popLast() {
                print(lastValue)
            }
            else {
                print("-1")
            }
        case "size":
            print(answerArray.count)
        case "empty":
            print(answerArray.isEmpty ? "1" : "0")
        case "top":
            print(answerArray.isEmpty ? "-1" : answerArray.last!)
        default:
            print("해당 없음.")
        }
    }
}
