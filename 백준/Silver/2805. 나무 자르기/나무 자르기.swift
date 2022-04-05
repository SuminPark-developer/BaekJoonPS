// MARK: - 2805번(이분탐색)
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, M) = (input[0], input[1])
let trees = readLine()!.split(separator: " ").map{Int(String($0))!}

var lowHeight: Int = 0
var highHeight: Int = trees.max()!
var answer: Int = 0 // 절단기 높이

while lowHeight <= highHeight {
    let middleHeight = (lowHeight + highHeight) / 2
    
//    let sum = trees.map{$0 - middleHeight}.reduce(0, +) // 이렇게 하면, 절단기 높이(middleHeight)가 더 높을 때 음수가 같이 더해짐.
    var sum: Int = 0
    for tree in trees {
        sum += tree - middleHeight > 0 ? tree - middleHeight : 0 // (나무 - 중간값) 들의 합 : 만약 음수면 안더함.
    }
    
    if sum >= M {
        lowHeight = middleHeight + 1
        answer = middleHeight
    }
    else {
        highHeight = middleHeight - 1
    }
}

print(answer)
