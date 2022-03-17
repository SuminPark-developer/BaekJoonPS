// 백준 - 1449번
let input = readLine()!.split(separator: " ").map{Int($0)!}
let N = input[0]
let L = input[1]

var pipe: [Bool] = [Bool](repeating: false, count: 1001) // 1000까지 포함이기 때문에 1001개로 설정. false인 부분은 물이 안새는 곳

var place = readLine()!.split(separator: " ").map{Int($0)!}

for i in place {
    pipe[i] = true
}

var count: Int = 0
var index: Int = 0
while index <= 1000 {
    if pipe[index] == true {
        index += L
        count += 1
    }
    else {
        index += 1
    }
}

print(count)
