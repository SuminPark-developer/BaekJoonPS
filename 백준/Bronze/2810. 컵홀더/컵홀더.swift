// MARK: - 2810번
import Foundation

let N = Int(readLine()!)!
var seat = readLine()!.replacingOccurrences(of: "LL", with: "L")

if N <= seat.count + 1 {
    print(N)
}
else {
    print(seat.count + 1)
}
