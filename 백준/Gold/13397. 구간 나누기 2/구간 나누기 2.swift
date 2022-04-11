// MARK: - 13397번(Parametric Search, 이분탐색)
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, M) = (input[0], input[1])
let numsArray = readLine()!.split(separator: " ").map{Int(String($0))!}

func isAble(_ standardScore: Int) -> Bool {
    var index: Int = 0
    var count: Int = 1 // 가장 마지막 구간은 카운팅이 안됨. 그래서 1로 시작.
    var temp: [Int] = []
    
    while index < N { // index가 0..<N까지. 그 구간에 1개만 있는 상황 체크를 위해, index를 빼줘야 해서 for문이 아닌 while문으로.
        temp.append(numsArray[index])
        let (max, min) = (temp.max()!, temp.min()!)
        if max - min > standardScore { // 기준값보다 클 때 구간이 바뀜.
            temp.removeAll()
            count += 1
//            temp.append(numsArray[index]) // 구간이 바뀌게 된 숫자부터 다시 시작. - 이 코드는 필요 없음. 이유 : 인덱스를 빼주면, 어차피 (코드상)5줄 위에서 다시 그 구간에 1개만 있는 상황으로 됨.
            index -= 1 // 인덱스를 다시 하나 빼줘야, 구간에 1개만 있는 상황이 체크됨.
        }
        index += 1
    }
    
    return count <= M // middle(standardScore)로 M개 이하의 구간을 만들었는가.
}

var low = 0
var high = numsArray.max()!
var answer: Int = 0
while low <= high {
    let middle = (low + high) / 2

    if isAble(middle) { // 구간점수들 중 최솟값(middle)로 가능하다면,
        high = middle - 1
        answer = middle
    }
    else { // 최솟값(middle)로 불가능하면, 더 큰 수로는 가능한지 체크하기 위해.
        low = middle + 1
    }
}

print(answer)