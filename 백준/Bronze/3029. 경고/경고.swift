// MARK: - 3029번
import Foundation
let timeNow = readLine()!.split(separator: ":").map{Int(String($0))!} // 현재 시간
let (nowH, nowM, nowS) = (timeNow[0], timeNow[1], timeNow[2])
let timeThrow = readLine()!.split(separator: ":").map{Int(String($0))!} // 던질 시간
var (throwH, throwM, throwS) = (timeThrow[0], timeThrow[1], timeThrow[2])

var totalTime: Int = 0

if (throwH == nowH) && (throwM == nowM) && (throwS == nowS) { // 시각이 같다면, 최대 24시간 기다림.
    print("24:00:00")
}
else {
    
    if throwH < nowH {
        throwH += 24
    }
    
    totalTime = ((throwH - nowH) * 3600) + ((throwM - nowM) * 60) + (throwS - nowS)
    
    let answerH = totalTime / 3600
    let answerM = (totalTime % 3600) / 60
    let answerS = (totalTime % 3600) % 60
    
    print("\(String(format: "%02d", answerH)):\(String(format: "%02d", answerM)):\(String(format: "%02d", answerS))")
    
}
