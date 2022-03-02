// MARK: - 17009번
var appleScore: [Int] = []
var bananaScore: [Int] = []

for _ in 0..<3 {
    appleScore.append(Int(readLine()!)!)
}
for _ in 0..<3 {
    bananaScore.append(Int(readLine()!)!)
}

let appleSum = (appleScore[0] * 3) + (appleScore[1] * 2) + appleScore[2]
let bananaSum = (bananaScore[0] * 3) + (bananaScore[1] * 2) + bananaScore[2]

if appleSum > bananaSum {
    print("A")
}
else if appleSum < bananaSum {
    print("B")
}
else {
    print("T")
}
