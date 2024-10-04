func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    let newCities = cities.map{$0.lowercased()}
    
    var cacheArray: [String] = []
    var time: Int = 0
    
    for city in newCities {
        if cacheArray.contains(city) { // Hit
            let index = cacheArray.firstIndex(of: city)!
            let value = cacheArray[index]
            cacheArray.remove(at: index)
            cacheArray.insert(value, at: 0)
            time += 1
        }
        else { // Miss
            time += 5
            if cacheArray.count < cacheSize {
                cacheArray.insert(city, at: 0)
            }
            else {
                cacheArray.insert(city, at: 0)
                cacheArray.removeLast()
            }
        }
        
    }
    
    return time
}