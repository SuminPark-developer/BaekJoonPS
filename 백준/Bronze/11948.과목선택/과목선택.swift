// MARK: - 11948번
var subjects1: [Int] = [] // (물리, 화학, 생물, 지구과학) 중 3개 선택
var subjects2: [Int] = [] // (역사, 지리) 중 1개 선택

for _ in 0..<4 {
    subjects1.append(Int(readLine()!)!)
}

for _ in 0..<2 {
    subjects2.append(Int(readLine()!)!)
}

subjects1.sort(by: >)
subjects2.sort(by: >)

subjects1.removeLast()
subjects2.removeLast()

var sum: Int = 0
sum += subjects1.reduce(0, +)
sum += subjects2.reduce(0, +)

print(sum)
