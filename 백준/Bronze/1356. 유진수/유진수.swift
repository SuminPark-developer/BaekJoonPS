// MARK: - 1356번
let N = readLine()!.map{String($0)}
var isU: Bool = false // 유진수 유무
var frontNums: [String] = []
var backNums: [String] = []

var index: Int = 0
for _ in 0..<N.count-1 { // 총 (N자리수-1)가지 방법
    index += 1
    
    var frontNum: String = ""
    for i in 0..<index {
        frontNum += N[i]
    }
    frontNums.append(frontNum)
    
    var backNum: String = ""
    for j in index..<N.count {
        backNum += N[j]
    }
    backNums.append(backNum)
}

//print(frontNums)
//print(backNums)

for i in 0..<frontNums.count {
    let chFrontArray = frontNums[i].map{Int(String($0))!}
    let frontValue = chFrontArray.reduce(1, *)
    
    let chBackArray = backNums[i].map{Int(String($0))!}
    let backValue = chBackArray.reduce(1, *)
    
    if frontValue == backValue { // 유진수
        isU = true
        break
    }
    
}

if isU {
    print("YES")
}
else {
    print("NO")
}
