// MARK: - 1764번
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, M) = (input[0], input[1])
var setA: Set<String> = []
var setB: Set<String> = []

for _ in 0..<N {
    setA.insert(readLine()!)
}
for _ in 0..<M {
    setB.insert(readLine()!)
}

var interSet: Set<String> = setA.intersection(setB) // setA와 setB 교집합.
let answer: [String] = Array(interSet).sorted(by: <)

print(answer.count)
for name in answer {
    print(name)
}
