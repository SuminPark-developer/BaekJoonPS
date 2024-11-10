// 백준 - 11720번
let N: Int = Int(readLine()!)!
let num: String = readLine()!

var sum: Int = 0

for i in num {
    let temp: String = String(i)
    sum += Int(temp)!
}

print(sum)
