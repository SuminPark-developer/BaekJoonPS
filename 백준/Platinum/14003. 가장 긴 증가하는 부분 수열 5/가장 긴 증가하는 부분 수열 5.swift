// MARK: - 14003번(DP - 반복문 / LIS - 이분탐색)
let N = Int(readLine()!)!
var arr: [Int] = readLine()!.split(separator: " ").map{Int(String($0))!}
var dp: [Int] = [arr[0]]
var indexArray: [Int] = [0] // dp배열에서 arr의 각 값이 몇번째 인덱스에 위치하는지 저장하는 배열.

for i in 1..<N {
    if arr[i] > dp.last! { // dp의 마지막 값보다 크면, 확인할 필요 없이 이어 붙이면 됨.
        dp.append(arr[i])
        indexArray.append(dp.count - 1) // dp배열에서의 위치(인덱스) 저장.
    }
    else { // dp의 마지막 값보다 크지 않다면, 이분탐색.
        let index = binarySearch(arr[i])
        dp[index] = arr[i] // 값 교체.
        indexArray.append(index) // dp배열에서의 위치(인덱스) 저장.
    }
}

print(dp.count) // LIS의 길이 출력.

var standard: Int = dp.count - 1 // 기준.
var answer: [Int] = []

for i in stride(from: N - 1, through: 0, by: -1) { // indexArray를 뒤에서부터 돌면서,
    if indexArray[i] == standard { // 기준값과 같다면,
        answer.append(arr[i])
        standard -= 1 // 기준값 -1씩.
    }
}

answer.reverse()
print(answer.map{String($0)}.joined(separator: " "))


func binarySearch(_ targetNum: Int) -> Int { // 이분탐색
    var (low, high) = (0, dp.count - 1)
    
    while low <= high {
        let middle = (low + high) / 2
        
        if dp[middle] >= targetNum {
            high = middle - 1
        }
        else {
            low = middle + 1
        }
    }
    return low
}
