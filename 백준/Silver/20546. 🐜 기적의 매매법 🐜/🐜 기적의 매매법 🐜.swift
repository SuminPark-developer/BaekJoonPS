// MARK: - 20546번
let money = Int(readLine()!)!
let stocks: [Int] = readLine()!.split(separator: " ").map{Int(String($0))!}

var updown: [String] = ["="]
for i in 1..<stocks.count {
    if stocks[i] > stocks[i - 1] {
        updown.append("+")
    }
    else if stocks[i] < stocks[i - 1] {
        updown.append("-")
    }
    else {
        updown.append("=")
    }
}
//print(updown)

var (junMoney, seoungMoney) = (money, money)
var (junCount, seoungCount) = (0, 0)

for stock in stocks {
    junCount += junMoney / stock
    junMoney = junMoney % stock
}

for i in 2..<stocks.count {
//    if stocks[i] > seoungMoney { // 성민이 - 빚내서 주식하지 않음.
//        continue
//    }
    
    if updown[i] == "=" {
        continue
    }
    
    if updown[i] == "+" && updown[i - 1] == "+" && updown[i - 2] == "+" { // 전량매도
        seoungMoney += seoungCount * stocks[i]
        seoungCount = 0
    }
    else if updown[i] == "-" && updown[i - 1] == "-" && updown[i - 2] == "-" { // 전량매수
        seoungCount += seoungMoney / stocks[i]
        seoungMoney = seoungMoney % stocks[i]
    }
//    print(i, seoungMoney, seoungCount)
}

var (junSum, seoungSum) = (0, 0)
junSum = junMoney + junCount * stocks.last!
seoungSum = seoungMoney + seoungCount * stocks.last!

if junSum > seoungSum {
    print("BNP")
}
else if junSum < seoungSum {
    print("TIMING")
}
else {
    print("SAMESAME")
}

