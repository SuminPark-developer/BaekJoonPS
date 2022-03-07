// 백준 - 4796번(그리디)
var testCase: Int = 0

while true {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (L, P, V) = (input[0], input[1], input[2]) // 연속하는 P일 중, L일동안만 사용할 수 있다. 전체 휴가는 V일.
    
    if L == 0 && P == 0 && V == 0 {
        break
    }
    
    testCase += 1
    var result = 0
    
    if (V % P) < L {
        result += (V / P) * L
        result += V % P
    }
    else {
        result += (V / P) * L
        result += L
    }
    
    print("Case \(testCase): \(result)")
    
}
