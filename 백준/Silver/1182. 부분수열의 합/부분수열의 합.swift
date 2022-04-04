// 백준 - 1182번(조합 - https://velog.io/@grap_ios/%EB%B0%B1%EC%A4%80-1182%EB%B2%88-%EB%B6%80%EB%B6%84%EC%88%98%EC%97%B4%EC%9D%98-%ED%95%A9)
let input = readLine()!.split(separator: " ").map{Int($0)!}
let N: Int = input[0]
let S: Int = input[1]

let arr = readLine()!.split(separator: " ").map{Int($0)!}
var count: Int = 0

func combination(_ index: Int, _ sum: Int) {
    if index >= N {
        return
    }
    if sum + arr[index] == S {
        count += 1
    }
    
    combination(index + 1, sum)
    combination(index + 1, sum + arr[index])
}

combination(0, 0)
print(count)
