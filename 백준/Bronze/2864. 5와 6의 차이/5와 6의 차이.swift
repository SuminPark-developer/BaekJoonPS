// MARK: - 2864번
import Foundation
let input = readLine()!.split(separator: " ").map{String($0)}
let maxArray = input.map{(num: String) -> String in
    let maxNum = num.replacingOccurrences(of: "5", with: "6")
    
    return maxNum
}

let minArray = input.map{(num: String) -> String in
    let minNum = num.replacingOccurrences(of: "6", with: "5")
    
    return minNum
}

let numMaxArray = maxArray.map{Int($0)!}
let numMinArray = minArray.map{Int($0)!}

let answerMax = numMaxArray.reduce(0, +)
let answerMin = numMinArray.reduce(0, +)

print(answerMin, answerMax)
