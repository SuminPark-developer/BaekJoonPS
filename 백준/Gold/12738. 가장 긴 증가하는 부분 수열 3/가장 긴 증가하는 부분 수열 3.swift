// MARK: - 12738번(DP - 반복문 / LIS - 이분탐색)
let N = Int(readLine()!)!
let arr: [Int] = readLine()!.split(separator: " ").map{Int(String($0))!}
var dp: [Int] = [arr[0]]

for i in 1..<N {
    if arr[i] > dp.last! { // 더 크면 그냥 뒤에 이어 붙이면 됨.
        dp.append(arr[i])
    }
    else {
        let index = binarySearch(arr[i])
        dp[index] = arr[i]
    }
}
print(dp.count)

func binarySearch(_ target: Int) -> Int {
    var (low, high) = (0, dp.count - 1)
    
    while low <= high {
        let middle = (low + high) / 2
        
        if dp[middle] >= target {
            high = middle - 1
        }
        else {
            low = middle + 1
        }
    }
    return low
}
