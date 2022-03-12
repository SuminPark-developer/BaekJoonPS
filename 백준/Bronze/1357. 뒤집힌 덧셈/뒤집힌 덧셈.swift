// MARK: - 1357번
import Foundation
func Rev(_ x: String) -> Int {
    var reverseNum: Int = 0
    var strX = x.map{String($0)}
    strX.reverse()
    
    let num: String = strX.reduce("", +)
    reverseNum = Int(num)!
    
    return reverseNum
}

let input = readLine()!.split(separator: " ").map{String($0)}
let (X, Y) = (input[0], input[1])

print(Rev(String(Rev(X) + Rev((Y)))))
