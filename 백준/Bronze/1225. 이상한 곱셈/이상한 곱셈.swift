// MARK: - 1225번
let input = readLine()!.split(separator: " ").map{String($0)}
let (A, B) = (input[0].map{String($0)}, input[1].map{String($0)})

var answer: Int = 0

for ch1 in A {
    for ch2 in B {
        answer += Int(ch1)! * Int(ch2)!
    }
}

print(answer)
