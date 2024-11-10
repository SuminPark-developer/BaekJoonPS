// MARK: - 3029번
import Foundation
let currentTime = readLine()!.split(separator: ":").map{Int(String($0))!}
let throwTime = readLine()!.split(separator: ":").map{Int(String($0))!}

let currentSec: Int = currentTime[0] * 60 * 60 + currentTime[1] * 60 + currentTime[2]
var throwSec: Int = throwTime[0] * 60 * 60 + throwTime[1] * 60 + throwTime[2]

if currentSec >= throwSec { // 다음날 인경우(ex. 00:00:00도 대응해야됨.)
    throwSec += 24 * 60 * 60
}

let answerSec: Int = throwSec - currentSec
let answerHH = String(format: "%02d", answerSec / 3600)
let answerMM = String(format: "%02d", answerSec % 3600 / 60)
let answerSS = String(format: "%02d", answerSec % 3600 % 60)

print("\(answerHH):\(answerMM):\(answerSS)")
