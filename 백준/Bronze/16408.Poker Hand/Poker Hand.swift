// MARK: - 16408번
let input = readLine()!.split(separator: " ").map{String($0)}
var countArray = Array(repeating: 0, count: 13)
let temp = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "T", "J", "Q", "K"]


for ch in input {

//    print(ch[ch.index(ch.startIndex, offsetBy: 1)])
    
    let comparisonCh = ch.first! // 혹은 이렇게 ch[ch.index(ch.startIndex, offsetBy: 0)]
    
    for (index, t) in temp.enumerated() {
        if String(comparisonCh) == t {
            countArray[index] += 1
        }
    }

}

print(countArray.max()!)


