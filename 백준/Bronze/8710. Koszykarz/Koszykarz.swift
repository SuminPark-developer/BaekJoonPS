// MARK: - 8710번
import Foundation
let input = readLine()!.split(separator: " ").map{Double(String($0))!}
let(k, w, m) = (input[0], input[1], input[2])
var count: Int = Int(ceil((w - k) / m))

print(count)
