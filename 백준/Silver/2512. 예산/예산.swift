// MARK: - 2512번(Binary Search)
let N = Int(readLine()!)!
let moneyArray = readLine()!.split(separator: " ").map{Int(String($0))!}
let M = Int(readLine()!)!
var answerMax: Int = 0

if moneyArray.reduce(0, +) <= M { // 모든 요청이 배정될 수 있는 경우,
    answerMax = moneyArray.max()!
}
else { // 모든 요청이 배정될 수 없는 경우,
    var start: Int = 0
    var end: Int = moneyArray.max()!
    var mid = (start + end) / 2
    
    while start <= end {
        var sum: Int = 0
        mid = (start + end) / 2
        for money in moneyArray {
            sum += money > mid ? mid : money // money가 기준(중간값)보다 크면 기준을 더하고, 기준보다 작거나 같으면 money를 더함.
        }
        if sum > M {
            end = mid - 1
        }
        else {
            start = mid + 1
        }
    }
    answerMax = end
}

print(answerMax) // 배정된 예산들 중 최댓값
