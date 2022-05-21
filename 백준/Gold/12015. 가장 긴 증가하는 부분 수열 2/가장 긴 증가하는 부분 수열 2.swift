// MARK: - 12015번(DP - 반복문) / LIS(이분탐색)
let N = Int(readLine()!)!
var arr: [Int] = readLine()!.split(separator: " ").map{Int(String($0))!}
var dp: [Int] = [arr[0]] // 이번 dp배열에선 길이를 저장하는 게 아니라, dp 전체가 가장 긴 증가하는 부분수열이 된다.(길이는 맞지만, 실제의 LIS와는 다르다.)

for i in 1..<N {
    if arr[i] > dp.last! { // dp배열의 가장 마지막에 있는 수보다 더 큰 수가 들어온다면,
        dp.append(arr[i]) // 그냥 맨 뒤에 이어 붙이면 됨.
    }
    else { // 하지만 그렇지 않다면, 이분탐색을 통해서 위치를 찾아서 넣어야 함.
        let index = binarySearch(arr[i])
        dp[index] = arr[i]
    }
}
print(dp.count)

func binarySearch(_ target: Int) -> Int { // 이분탐색
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
