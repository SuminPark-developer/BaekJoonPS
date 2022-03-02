// MARK: - 16199번
let bornYear = readLine()!.split(separator: " ").map{Int(String($0))!}
let standardYear = readLine()!.split(separator: " ").map{Int(String($0))!}


let yearLaw: Int = standardYear[0] - bornYear[0] // 연 나이
let yearKorea: Int = 1 + yearLaw // 세는 나이
var yearGlobal: Int = 0 // 만 나이

if standardYear[0] > bornYear[0] { // 년 지났을 때,
    if standardYear[1] > bornYear[1] { // 월 지났을 때,
        yearGlobal = standardYear[0] - bornYear[0]
    }
    else if standardYear[1] < bornYear[1] { // 월 안 지났을 때,
        yearGlobal = standardYear[0] - bornYear[0] - 1
    }
    else { // 월 같을 때,
        if standardYear[2] >= bornYear[2] { // 일 같거나 지났을 때,
            yearGlobal = standardYear[0] - bornYear[0]
        }
        else { // 일 안 지났으면,
            yearGlobal = standardYear[0] - bornYear[0] - 1
        }
    }
}
else { // 연도가 같으면,
    yearGlobal = 0 // 만 나이는 0살
}

print(yearGlobal)
print(yearKorea)
print(yearLaw)
