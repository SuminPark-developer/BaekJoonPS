// 백준 - 2231번
let N = Int(readLine()!)!

var min: Int = N

for i in stride(from: N, through: 1, by: -1) {
    var temp: Int = i
    var sum: Int = temp
    
    while temp > 0 {
        sum += temp % 10
        temp /= 10
    }
    if sum == N {
        min = i
    }
    
}

if min == N { // min이 변동이 없다면,(= 생성자가 없다면)
    print(0)
}
else {
    print(min)
}