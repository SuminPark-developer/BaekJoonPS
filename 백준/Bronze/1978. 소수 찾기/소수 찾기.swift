// MARK: - 1978번(2)
let N = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map{Int(String($0))!}

var isPrimeArray = [false, false] + Array(repeating: true, count: 999)

for i in 2...1000 {
    if !isPrimeArray[i] {
        continue
    }
    for j in stride(from: i*2, through: 1000, by: i) {
        isPrimeArray[j] = false
    }
}

var answer: Int = 0
for num in input {
    if isPrimeArray[num] {
        answer += 1
    }
}

print(answer)
