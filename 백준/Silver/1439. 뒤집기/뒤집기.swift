// 백준 - 1439번
let S = Array(readLine()!)
var zeroCount: Int = 0
var oneCount: Int = 0
var before = S.first

if before == "0" {
    oneCount += 1
}
else {
    zeroCount += 1
}

for i in S {
    if i != before {
        if i == "0" {
            oneCount += 1
        }
        else {
            zeroCount += 1
        }
        before = i
    }
}

print(min(zeroCount, oneCount))
