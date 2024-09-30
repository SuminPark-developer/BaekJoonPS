// MARK: - 5618번
let n = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted(by: <)
var answer: [Int] = []


let last = input.first!

for i in 1...last {
    if n == 2 {
        if(input[0] % i == 0 && input[1] % i == 0) {
            answer.append(i)
        }
    }
    else {
        if(input[0] % i == 0 && input[1] % i == 0 && input[2] % i == 0) {
            answer.append(i)
        }
    }
}

for num in answer {
    print(num)
}
