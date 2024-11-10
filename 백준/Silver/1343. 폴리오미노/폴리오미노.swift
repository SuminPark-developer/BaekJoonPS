// MARK: - 1343번
import Foundation
var input = readLine()!.map{String($0)}
var answer = input
input.append(".") // ex) XXXXX 대응.

var indexArray: [(from: Int, to: Int)] = []

var length: Int = 0
var from = -1
for (index, ch) in input.enumerated() {
    if ch == "X" {
        if from == -1 {
            from = index
        }
        length += 1
        continue
    }
    else { // "."이면,
        indexArray.append((from, from + length))
        from = -1
        length = 0
    }
    
}

//print(indexArray)
//print(indexArray.filter{$0.from != -1})


for item in indexArray {
    let length = item.to - item.from // X의 길이
    let maxLength = length / 4 // 4의 최대 개수
    var isChangedFlag: Bool = false // ex) ..X..XX 대응.
    
    for num4Count in stride(from: maxLength, through: 0, by: -1) {
        if (length - (num4Count * 4)) % 2 == 0 { // 4와 2로 이루어짐.
            for i in item.from..<(item.from + num4Count * 4) {
                answer[i] = "A"
            }
            for j in (item.from + num4Count * 4)..<item.to {
                answer[j] = "B"
            }
            isChangedFlag = true
            break
        }
    }
    if !isChangedFlag { // X가 있는 인덱스(from..<to)에서 변경실패했다면, ex) ..X..XX 대응.
        print(-1)
        exit(0)
    }
}

print(answer.joined(separator: ""))

