// MARK: - 1002번
import Foundation
let T = Int(readLine()!)!

for _ in 0..<T {
    let input = readLine()!.split(separator: " ").map{Double(String($0))!}
    var (x1, y1, r1) = (input[0], input[1], input[2])
    var (x2, y2, r2) = (input[3], input[4], input[5])
    var answer: Int = 0
    
    let d = sqrt(pow(x2 - x1, 2.0) + pow(y2 - y1, 2.0))
    
    if d > (r1 + r2) { // Case 1
        answer = 0
    }
    else if d == (r1 + r2) { // Case 2
        answer = 1
    }
    
    else {
        if r1 < r2 { // 가정이 r1>=r2이기 때문에, 맞춰주기 위해서 swap.
            swap(&r1, &r2)
        }
        
        if ((r1 - r2) < d) && (d < (r1 + r2)) { // Case 3
            answer = 2
        }
        else if d != 0 && d == (r1 - r2) { // Case 4
            answer = 1
        }
        else if d != 0 && d < (r1 - r2) { // Case 5
            answer = 0
        }
        else if r1 == r2 && d == 0 { // Case 6
            answer = -1
        }
        else if r1 != r2 && d == 0 { // Case 7
            answer = 0
        }
    }
    
    
    print(answer)
}
