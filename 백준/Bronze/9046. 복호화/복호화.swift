// MARK: - 9046번
let T = Int(readLine()!)!

let alpha = "abcdefghijklmnopqrstuvwxyz".map{String($0)}
let cipher = "wghuvijxpqrstacdebfklmnoyz".map{String($0)}

for _ in 0..<T {
    var countArray = Array(repeating: 0, count: 26)
    let input = readLine()!.split(separator: " ").map{String($0)}
    
    for word in input {
        let temp = word.map{String($0)}
        
        for ch in temp {
            let index = alpha.firstIndex(of: ch)!
            
            countArray[index] += 1
        }
    }

    let maxValue = countArray.max()!
    if countArray.filter({$0 == maxValue}).count > 1 {
        print("?")
    }
    else {
        let answerIndex: Int = countArray.firstIndex(of: maxValue)!
        print(alpha[answerIndex])
    }
    
}
