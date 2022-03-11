// 백준 - 1193번
let X = Int(readLine()!)!


if X == 1 {
    print("1/1")
}

else {
    var numerator: Int = 1 // 분자
    var denominator: Int = 2 // 분모
    
    while true {
        
        if X <= numerator + denominator {
            let a: Int = (numerator + denominator) - X + 1
            let b: Int = (denominator + 1) - a
            
            if denominator % 2 == 0 {
                print("\(b)/\(a)")
            }
            else {
                print("\(a)/\(b)")
            }
            break
        }
        
        else {
            numerator += denominator
            denominator += 1
        }
        
        
    }
    
}
