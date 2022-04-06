// MARK: - 2512번(이분탐색)
let N = Int(readLine()!)!
let moneys = readLine()!.split(separator: " ").map{Int(String($0))!}
let M = Int(readLine()!)!

var low = 1
var high = moneys.max()!
var answer: Int = 0

while low <= high {
    let middle = (low + high) / 2
    var sum: Int = 0
    
    for money in moneys {
        sum += money > middle ? middle : money
    }
    
    if sum <= M {
        low = middle + 1
        answer = middle
    }
    else {
        high = middle - 1
    }
}

print(answer)
