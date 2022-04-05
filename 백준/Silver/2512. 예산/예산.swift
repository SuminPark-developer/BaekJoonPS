// MARK: - 2512번(Binary Search)
let N = Int(readLine()!)!
let moneyArray = readLine()!.split(separator: " ").map{Int(String($0))!}
let M = Int(readLine()!)!
var answerMax: Int = 0

var low = 0
var high = moneyArray.max()!
var middle = (low + high) / 2

func isPossible(_ middle: Int) -> Bool {
    var sum: Int = 0
    for money in moneyArray {
        sum += min(money, middle)
    }
    return sum <= M
}

while low <= high { // Parametric Search & Binary Search
    if isPossible(middle) { // 기준예산(middle)으로 충당이 가능하면,
        low = middle + 1 // 기준예산보다 위로 다시 체크.
        answerMax = middle
    }
    else { // 기준예산(middle)으로 충당이 불가능하면,
        high = middle - 1 // 기준예산보다 밑으로 다시 체크.
    }
    
    middle = (low + high) / 2
}

print(answerMax)
