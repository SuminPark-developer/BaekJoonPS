// 백준 - 1021번
var input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, M) = (input[0], input[1])

var deQue = [Int]()
for i in 1...N {
    deQue.append(i)
}

var array = readLine()!.split(separator: " ").map{Int(String($0))!}
var answer: Int = 0 // 2번케이스 or 3번케이스를 진행한 횟수.

for num in array {

    let index = deQue.firstIndex(of: num)!
    let count = deQue.count // deQue의 개수
    
    if index <= count - index { // <-방향으로 이동. (2번케이스)
        while deQue.first != num { // 원하는 숫자가 나올때까지 돌림.
            deQue.reverse()
            let temp = deQue.popLast()!
            deQue.reverse()
            deQue.append(temp)
            answer += 1
        }
        // 1번케이스 진행.
        deQue.reverse()
        deQue.popLast()
        deQue.reverse()
    }
    else { // ->방향으로 이동. (3번케이스)
        while deQue.first != num { // 원하는 숫자가 나올때까지 돌림.
            let temp = deQue.popLast()!
            deQue.reverse()
            deQue.append(temp)
            deQue.reverse()
            answer += 1
        }
        // 1번케이스 진행.
        deQue.reverse()
        deQue.popLast()
        deQue.reverse()
    }

}

print(answer)

