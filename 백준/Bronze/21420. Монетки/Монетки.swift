// MARK: - 21420번
let N = Int(readLine()!)!
var coinArray: [Int] = []
var countNum0 = 0 // 뒷면 개수
var countNum1 = 0 // 앞면 개수

for _ in 0..<N {
    coinArray.append(Int(readLine()!)!)
}

countNum0 = coinArray.filter{$0 == 0}.count
countNum1 = coinArray.filter{$0 == 1}.count

print(min(countNum0, countNum1))
