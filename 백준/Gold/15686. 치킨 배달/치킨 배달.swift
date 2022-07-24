// MARK: - 15686번(조합, 완전탐색)
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, M) = (input[0], input[1])
var board: [[Int]] = Array(repeating: [], count: N + 1)

func combi(_ nums: [(Int, Int)], _ targetNum: Int) -> [[(y: Int, x: Int)]] {
    var result: [[(Int, Int)]] = []
    
    func combination(_ index: Int, _ nowCombi: [(Int, Int)]) {
        if nowCombi.count == targetNum {
            result.append(nowCombi)
            return
        }
        for i in index..<nums.count {
            combination(i + 1, nowCombi + [nums[i]])
        }
    }
    combination(0, [])
    
    return result
}

for i in 1...N {
    board[i] = [-1] + readLine()!.split(separator: " ").map{Int(String($0))!} // 0: 빈 칸, 1: 집, 2: 치킨집
}

var chickenCoords: [(Int, Int)] = [] // 치킨집들의 좌표 저장.
for y in 1...N {
    for x in 1...N {
        if board[y][x] == 2 { // 치킨집일 때,
            chickenCoords.append((y, x))
        }
    }
}
//print(chickenCoords)
let chickenCombi = combi(chickenCoords, M) // 치킨집들 중, M개를 선택하는 경우의 좌표 모음.
//print(chickenCombi)
var distances: [Int] = [] // 치킨거리 모음.

for chickens in chickenCombi {
    var sum: Int = 0
    
    for y in 1...N {
        for x in 1...N {
            if board[y][x] == 1 { // 집일 때,
                var chickenDistance: Int = Int.max
                for chicken in chickens {
                    let distanceY: Int = abs(y - chicken.y)
                    let distanceX: Int = abs(x - chicken.x)
                    chickenDistance = min(chickenDistance, distanceY + distanceX)
                }
                sum += chickenDistance
            }
        }
    }
    distances.append(sum)
}

print(distances.min()!)
