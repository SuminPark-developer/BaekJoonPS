// MARK: - 1340번
import Foundation
var input = readLine()!.components(separatedBy: [",", " ", ":"])
input.remove(at: 2) // 빈 문자열 제거
let (month, day, year, hour, minute) = (input[0], Double(input[1])!, Int(input[2])!, Double(input[3])!, Double(input[4])!)

var isYoon: Bool = false // 윤년인지 아닌지
var fullDay: Double = 365 * 24 * 60 // 평년시, 365일

if (year % 400 == 0) || ((year % 4 == 0) && (year % 100 != 0)) { // 윤년 조건
    isYoon = true
    fullDay = 366 * 24 * 60 // 윤년시, 366일
}

let monthIndexArray: [String: Int] = ["January": 0, "February": 1, "March": 2, "April": 3, "May": 4, "June": 5, "July": 6, "August": 7, "September": 8, "October": 9, "November": 10, "December": 11] // 인덱스 연결
let monthYoonArray: [Double] = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31] // 윤년은 2월29일까지
let monthArray: [Double] = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31] // 평년

var answer: Double = 0.0 // 몇 퍼센트인지.
var daySum: Double = 0 // 해당 전 월까지의 일자 총합.

if isYoon { // 윤년 시,
    for i in 0..<monthIndexArray[month]! {
        daySum += monthYoonArray[i]
    }
    answer = (((daySum + day - 1) * 1440) + hour * 60 + minute) / fullDay * 100
}
else { // 윤년 아닐 시,
    for i in 0..<monthIndexArray[month]! {
        daySum += monthArray[i]
    }
    answer = (((daySum + day - 1) * 1440) + hour * 60 + minute) / fullDay * 100
}

print(answer)
