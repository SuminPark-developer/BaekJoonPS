// MARK: - 13771번
import Foundation

let N = Int(readLine()!)!
var numArray: [Double] = []

for _ in 0..<N {
    numArray.append(Double(readLine()!)!)
}
numArray.sort(by: <)

let answer = String(format: "%.2f", numArray[1])
print(answer)
