// MARK: - 2745번
import Foundation
let input = readLine()!.split(separator: " ").map{String($0)}
let (N, B) = (input[0], input[1])

let result = Int(N, radix: Int(B)!)!
print(result)
