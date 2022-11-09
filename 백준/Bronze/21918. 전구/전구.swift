// MARK: - 21918번
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, M) = (input[0], input[1])
var tempBulbs: [Int] = readLine()!.split(separator: " ").map{Int(String($0))!} // 전구상태 임시 저장.
var bulbs: [Bool] = [false] // 전구상태 저장.(인덱스 0은 채움.)
for bulb in tempBulbs {
    bulbs.append(bulb == 1 ? true : false)
}

func command(_ num: Int, _ b: Int, _ c: Int) -> Void { // 명령어 함수
    switch num {
    case 1: // 특정값으로 변경
        bulbs[b] = (c == 1 ? true : false)
    case 2: // 토글
        for index in b...c {
            bulbs[index].toggle()
        }
    case 3: // 끄기
        for index in b...c {
            bulbs[index] = false
        }
    case 4: // 켜기
        for index in b...c {
            bulbs[index] = true
        }
    default:
        print("default는 없음.")
    }
}

for _ in 0..<M {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (a, b, c) = (input[0], input[1], input[2])
    command(a, b, c) // 명령어 호출
}

var answer: [String] = bulbs.map{$0 == true ? "1" : "0"}
print(answer[1...].joined(separator: " ")) // 0번째 인덱스는 제외.
