// MARK: - 2417번(이분탐색)
let n = Double(readLine()!)! // Int로 하면 middle제곱부분에서 범위 초과.
//var low = 0
//var high = n
//var answer: Int = 0
//
//while low <= high {
//    let middle = (low + high) / 2
//
//    if middle * middle >= Int(n) {
//        high = middle - 1
//        answer = middle
//    }
//    else {
//        low = middle + 1
//    }
//}

var low = 0.0, high = n, answer = 0.0 // Double로 하면 이분탐색 가능.

while low <= high {
    let middle = Double(Int((low + high) / 2)) // 중간에 Int로 바꾸는 이유는, /2를 했을 때 소수점을 없애기 위해서.
    
    if middle * middle >= n {
        high = middle - 1
        answer = middle
    }
    else {
        low = middle + 1
    }
    
}

print(Int(answer))
