// MARK: - 20444번(이분탐색)
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (n, k) = (input[0], input[1])

//var numArray: [(horizontal: Int, vertical: Int)] = [] // (가로방향으로 자르는 횟수, 세로방향으로 자르는 횟수)
//for i in 0...n/2 {
//    numArray.append((i, n - i))
//}

//var countArray: [Int] = []
//for nums in numArray {
//    countArray.append((nums.horizontal + 1) * (nums.vertical + 1))
//}

//for i in 0...n/2 {
//    countArray.append((i + 1) * ((n - i) + 1))
//}

//countArray.sort(by: <)

var low: Int = 0
var high: Int = n/2
var answer: String = "NO"

while low <= high {
    let middle = (low + high) / 2
    let count = (middle + 1) * ((n - middle) + 1)
    
    if count == k {
        answer = "YES"
        break
    }
    
    if count > k {
        high = middle - 1
    }
    else {
        low = middle + 1
    }
}

print(answer)
