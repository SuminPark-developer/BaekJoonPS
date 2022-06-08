// MARK: - 1524번(팰린드롬)
let S = readLine()!.map{String($0)}
let length: Int = S.count

for i in 0..<length { // 맨 앞부터 돌면서,
    var strArray: [String] = []
    for j in i...length-1 { // i번째부터 끝까지의 [String]을 만든 뒤,
        strArray.append(S[j])
    }
    
    if isPalindrome(strArray) { // 만약 팰린드롬이면, 기존의 길이(length) + 앞쪽에서 뒤로 이동한 만큼(인덱스 i)이 정답.
        print(length + i)
        break
    }
}

func isPalindrome(_ strArr: [String]) -> Bool {
    let length: Int = strArr.count
    var flag: Bool = true
    
    for i in 0..<length/2 {
        if strArr[i] != strArr[length - 1 - i] { // 앞부분과 뒷부분이 다르다면,
            flag = false
            break
        }
    }
    
    return flag
}
