// MARK: - 1371번
var alphabet = Array(repeating: 0, count: 26) // 알파벳 카운팅

while let input = readLine() {
    let str = input.split(separator: " ").map{String($0)}

    for arr in str {
        for ch in arr {
            let index: Int = Int(Character(String(ch)).asciiValue!) - Int(Character("a").asciiValue!)
//            let index2 = Int(UnicodeScalar((String(ch)))!.value) - Int(UnicodeScalar(("a")).value) // 방법 2가지
            alphabet[index] += 1
        }
    }

}

var answerIndexArray: [Int] = []
let maxValue = alphabet.max()!
for (index, num) in alphabet.enumerated() {
    if num == maxValue {
        answerIndexArray.append(index)
    }
}

for i in answerIndexArray {
    let ch = UnicodeScalar(97 + i)!
    print(ch, terminator: "")
}
