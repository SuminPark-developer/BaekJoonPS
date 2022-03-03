// MARK: - 16408번
let input = readLine()!.split(separator: " ").map{String($0)}
var countArray = Array(repeating: 0, count: 13)
let temp = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "T", "J", "Q", "K"]

for chFirst in input {
    
    let first: String = String(chFirst.first!)
    
    for (index, ch) in temp.enumerated() {
        if ch == first {
            countArray[index] += 1
        }
    }
    
}

print(countArray.max()!)
