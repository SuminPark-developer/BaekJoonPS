// MARK: - 14916번
import Foundation
let input = Int(readLine()!)!
var coin: Int = 0

if input % 5 == 0 { // 5의 배수인 경우
    coin = input / 5
}
else { // 5의 배수가 아닌 경우
    let maxCount = input / 5
    for i in stride(from: maxCount, through: 1, by: -1) {
        if (input - (5 * i)) % 2 == 0 { // 5를 최대한 활용하고 난 나머지가 2의 배수인 경우
            coin = i + ((input - (5 * i)) / 2) // 5원 개수 + 2원 개수
            break
        }
    }
    if coin == 0 {
        if input % 2 == 0 { // 무조건 2로만 나뉘는 경우. ex) 6
            coin = input / 2
        }
        else { // 거슬러 줄 수 없는 경우
            coin = -1
        }
    }
}

print(coin)
