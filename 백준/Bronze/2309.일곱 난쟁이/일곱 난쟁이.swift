// 백준 - 2309번
var height: [Int] = [Int](repeating: 0, count: 9)
var sum: Int = 0

for i in 0..<9 {
    height[i] = Int(readLine()!)!
    sum += height[i]
}


forloop: for i in 0...9-2 {
    for j in i+1...9-1 {
        if (sum - (height[i] + height[j])) == 100 {
            height[i] = 0
            height[j] = 0
            break forloop
        }
    }
}

height.sort()

for i in 2..<height.count {
    print(height[i])
}
