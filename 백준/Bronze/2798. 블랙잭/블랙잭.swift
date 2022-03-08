// 백준 - 2798번
var input = readLine()!.split(separator: " ").map{Int($0)!}
let N: Int = input[0]
let M: Int = input[1]

input = readLine()!.split(separator: " ").map{Int($0)!}
input.sort()

func BlackJack(_ N: Int, _ M: Int, _ cards: [Int]) -> Int {
    var nowMax: Int = 0
    
    for firstIndex in 0..<N {
        for secondIndex in firstIndex+1..<N {
            for thirdIndex in secondIndex+1..<N {
                let now = cards[firstIndex] + cards[secondIndex] + cards[thirdIndex]
                
                if M == now { // M과 같다면 바로 최대값
                    nowMax = now
                    return nowMax
                }
                else if M < now { // over한 상태기 때문에 패스
                    continue
                }
                else if M > now { // M보다 작다면, 더 큰 상황이 있는지 봄.
                    if nowMax < now { // 지금의 now값이 원래의 nowMax값보다 크다면,
                        nowMax = now // nowMax에 now값 할당.
                    }
                }
                
            }
        }
    }
    
    return nowMax
    
}

print(BlackJack(N, M, input))
