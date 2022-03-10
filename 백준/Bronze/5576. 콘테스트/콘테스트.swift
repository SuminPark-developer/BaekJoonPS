// MARK: - 5576번
var W: [Int] = []
var K: [Int] = []

for _ in 0..<10 {
    W.append(Int(readLine()!)!)
}
for _ in 0..<10 {
    K.append(Int(readLine()!)!)
}

W.sort(by: >)
K.sort(by: >)

let wSum = W[0] + W[1] + W[2]
let kSum = K[0] + K[1] + K[2]

print(wSum, kSum)
