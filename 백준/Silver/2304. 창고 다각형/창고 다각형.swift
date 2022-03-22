// MARK: - 2304번
let N = Int(readLine()!)!
var info: [(coord: Int, height: Int)] = []
var array = Array(repeating: 0, count: 1001)

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    info.append((input[0], input[1]))
    array[input[0]] = input[1] // 좌표별 값 대입.
}

info.sort(by: <)
var maxCoord: Int = 0
var maxHeight: Int = 0
for data in info {
    if data.height > maxHeight {
        maxHeight = data.height
        maxCoord = data.coord
    }
}

var answer: Int = 0
var temp: Int = 0
for i in 0..<maxCoord+1 { // 왼쪽 -> 오른쪽(큰기둥)
    if array[i] > temp { // 더 큰 기둥을 만나면,
        temp = array[i]
    }
    answer += temp
}
temp = 0
for i in stride(from: 1000, to: maxCoord, by: -1) { // 오른쪽 -> 왼쪽(큰기둥)
    if array[i] > temp { // 더 큰 기둥을 만나면,
        temp = array[i]
    }
    answer += temp
}

print(answer)
