// 백준 - 2750번
let N = Int(readLine()!)!
var num: [Int] = [Int](repeating: 0, count: N)

for i in 0..<N {
    num[i] = Int(readLine()!)!
}
num.sort()

for i in num {
    print(i)
}
