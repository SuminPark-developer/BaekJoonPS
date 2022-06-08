// MARK: - 8892번(팰린드롬)
let T = Int(readLine()!)!

for _ in 0..<T {
    let k = Int(readLine()!)!
    var arr: [String] = []
    for _ in 0..<k {
        arr.append(readLine()!)
    }
    
    var hasPalindrome: Bool = false // 팰린드롬 존재 유무.
    outLoop: for i in 0..<k {
        for j in 0..<k {
            if i != j { // 인덱스가 다를 때에만,
                let temp: String = (arr[i] + arr[j])
                let tempArr: [String] = temp.map{String($0)}
                
                if isPalindrome(tempArr) {
                    hasPalindrome = true // 팰린드롬 존재.
                    print(temp)
                    break outLoop
                }
            }
        }
    }
    
    if !hasPalindrome { // 만들 수 없으면,
        print(0) // 0출력.
    }
    
}

func isPalindrome(_ strArr: [String]) -> Bool {
    let length: Int = strArr.count
    var flag: Bool = true // 팰린드롬 체크.

    for i in 0..<length/2 {
        if strArr[i] != strArr[length - 1 - i] {
            flag = false
            break
        }
    }

    return flag
}
