// 백준 - 7568번
let N = Int(readLine()!)!

var weight: [Int] = []
var height: [Int] = []

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    weight.append(input[0])
    height.append(input[1])
}


var rank: [Int] = [Int](repeating: 0, count: N)

for i in 0..<N {
    let (userWeight, userHeight) = (weight[i], height[i])
    var count: Int = 0
    
    for j in 0..<N {
        if j == i { // 같은 사람일땐 패스
            continue
        }
        if userWeight < weight[j] && userHeight < height[j] {
            count += 1
        }
    }
    rank[i] = count + 1 // 덩치 등수
    
}

for i in rank {
    print(i, terminator: " ")
}
