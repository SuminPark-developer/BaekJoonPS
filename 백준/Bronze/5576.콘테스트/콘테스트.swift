// MARK: - 5576번
var collegeW: [Int] = []
var collegeK: [Int] = []

for _ in 0..<10 {
    collegeW.append(Int(readLine()!)!)
}
for _ in 0..<10 {
    collegeK.append(Int(readLine()!)!)
}

collegeW.sort(by: >)
collegeK.sort(by: >)

let scoreW = collegeW[0] + collegeW[1] + collegeW[2]
let scoreK = collegeK[0] + collegeK[1] + collegeK[2]

print(scoreW, scoreK)
