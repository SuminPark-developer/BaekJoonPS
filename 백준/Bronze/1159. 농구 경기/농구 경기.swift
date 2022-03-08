// MARK: - 1159번
let N = Int(readLine()!)!
var alphabet = Array(repeating: 0, count: 26) // a~z 개수

for _ in 0..<N {
    let input = readLine()!.map{String($0)}
    let index = Int(Character(input.first!).asciiValue! - Character("a").asciiValue!)
    
    alphabet[index] += 1
}

let check = alphabet.filter{$0 >= 5}

if check.isEmpty {
    print("PREDAJA")
}
else {
    for (index, count) in alphabet.enumerated() {
        if count >= 5 {
            let answer = Character(UnicodeScalar(97 + index)!) // a의 아스키코드값 + index
            print(answer, terminator: "")
        }
    }
}
