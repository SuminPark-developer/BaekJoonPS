//  백준 - 11047번
let input = readLine()!.split(separator: " ").map{Int($0)!}
let N = input[0]
var K = input[1]

var coins: [Int] = []
for _ in 0..<N {
    coins.append(Int(readLine()!)!)
}

coins.reverse()
//coins.sort(by: >)

var count: Int = 0

for i in 0..<N {
    count += K / coins[i]
    K = K % coins[i]
}

print(count)
