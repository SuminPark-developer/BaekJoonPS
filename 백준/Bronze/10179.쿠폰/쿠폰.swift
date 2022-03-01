// MARK: - 10179번
import Foundation
let N = Int(readLine()!)!

for _ in 0..<N {
    let input = Double(readLine()!)!
    
    let temp = input * 0.8
    let answer = String(format: "%.2f", temp)
    print("$\(answer)")
    
}
