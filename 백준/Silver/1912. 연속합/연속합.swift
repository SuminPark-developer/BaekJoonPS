// MARK: - 1912번(DP - 반복문)
let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int(String($0))!}
var cache = Array(repeating: 0, count: n)
cache[0] = arr[0]
var maxValue = cache[0] // cache에 있는 값 중, 최대값(최종 정답)

for i in 1..<n {
    cache[i] = max(arr[i], cache[i-1] + arr[i])
    
    if cache[i] > maxValue {
        maxValue = cache[i]
    }
    
}

print(maxValue)
