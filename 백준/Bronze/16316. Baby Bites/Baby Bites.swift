// MARK: - 16316번
let n = Int(readLine()!)!
var input = readLine()!.split(separator: " ").map{String($0)}
var answerArray: [String] = []

for i in 0..<n {
    answerArray.append(String(i + 1))
}

for (index, ch) in input.enumerated() {
    if ch == "mumble" {
        input[index] = String(index + 1)
    }
}

if input == answerArray {
    print("makes sense")
}
else {
    print("something is fishy")
}
