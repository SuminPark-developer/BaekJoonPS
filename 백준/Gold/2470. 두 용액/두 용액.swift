// MARK: - 2470번(이분탐색)
let N = Int(readLine()!)!
let liquids = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted(by: <)
var lowIndex: Int = 0
var highIndex: Int = N - 1

var distance: Int = 2000000000 // 0과의 거리. - 최대 1000000000라서 2배.
var answerLowIndex: Int = 0
var answerHighIndex: Int = N - 1

while lowIndex < highIndex {
    let temp = liquids[lowIndex] + liquids[highIndex]
    if abs(temp) < distance { // 새로운조합이 기존보다 0과의 거리가 더 작으면, (등호가 들어가도 되고 안 들어가도 됨. 등호가 들어가게 되면, 거리가 같은게 있을 때 점점 가운데쪽 인덱스로 가까워짐. 등호가 없으면, 거리가 같은게 있어도 바깥쪽 인덱스에서 가운데쪽으로 가까워지지 않음.)
        distance = abs(temp)
        answerLowIndex = lowIndex
        answerHighIndex = highIndex
        if temp == 0 { // 만약 0이면, 더 이상 확인할 필요 없이 바로 stop.
            break
        }
    }
    
    if temp < 0 { // 음(-)이 더 강하면, 양(+)쪽으로.
        lowIndex += 1
    }
    else { // 양(+)이 더 강하면, 음(-)쪽으로.
        highIndex -= 1
    }
}

print(liquids[answerLowIndex], liquids[answerHighIndex])
