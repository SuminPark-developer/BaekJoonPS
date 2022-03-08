// MARK: - 2751번
let N = Int(readLine()!)!
var numArray: [Int] = []

for _ in 0..<N {
    numArray.append(Int(readLine()!)!)
}

numArray.sort(by: <)

for num in numArray {
    print(num)
}
