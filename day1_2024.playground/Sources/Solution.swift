import Foundation

public func historianHysteria(_ input: String) -> Int {
    
    var locations = input.inputToLocations()
    var distance: Int = 0
    
    // Sort the lists so only one pass of the arrays are needed
    locations.leftList.sort()
    locations.rightList.sort()
    
    // Iterate the lists
    for i in 0..<locations.leftList.count {
        // calculate the difference between the left and right lists, add it to the distance
        distance += abs(locations.leftList[i] - locations.rightList[i])
    }
    
    // Return the distance
    return distance
}

public func historianHysteriaPartTwo(_ input: String) -> Int {
    
    let locations = input.inputToLocationsPartTwo()
    var similarity: Int = 0
    
    // Iterate the left lists
    for i in 0..<locations.leftList.count {
        // Calculate the similarity between the left and right lists, add it to the similarity
        let val = locations.leftList[i]
        similarity += val * (locations.rightList[val] ?? 0)
    }
    
    // Return the similarity
    return similarity
}
