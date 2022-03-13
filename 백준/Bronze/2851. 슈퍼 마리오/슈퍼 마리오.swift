// MARK: - 2851번
var mushrooms: [Int] = []
for _ in 0..<10 {
    mushrooms.append(Int(readLine()!)!)
}

var scores: [Int] = []
for i in 0..<10 {
    var sum: Int = 0
    for j in 0...i {
        sum += mushrooms[j]
    }
    scores.append(sum)
}

var distance: [Int] = []
for score in scores {
    distance.append(abs(100 - score))
}

var indexes: [Int] = [] // 100과의 거리가 제일 가까운 index들 모음.
for (index, d) in distance.enumerated() {
    if d == distance.min()! {
        indexes.append(index)
    }
}

var maxScores: [Int] = []

for i in indexes {
    maxScores.append(scores[i])
}

print(maxScores.max()!)
