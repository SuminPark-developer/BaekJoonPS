// 백준 - 1302번
let N = Int(readLine()!)!
var book = [String : Int]()

for _ in 0..<N {
    let title: String = readLine()!
    
    if book.keys.contains(title) { // 팔린적 있는 책이라면,
        book["\(title)"]! += 1 // 그 책 판매 횟수 1 증가.
    }
    else { // 처음 팔린 책이라면,
        book["\(title)"] = 1 // dictionary에 등록 & 판매 횟수 1로 세팅.
    }
    
}

var max: Int = (book.values).max()! // 팔린 최대 횟수
var answer: String = "" // 가장 많이 팔린 책의 제목

for (key, value) in book {
    if value == max { // 가장 많이 팔린 책들 중 하나라면,
        if answer == "" || key < answer { // (""는 가장 사전 중 앞이라서) 새로운 책 제목이 answer보다 먼저오는 책이라면,
            answer = key
        }
    }
}

print(answer)
