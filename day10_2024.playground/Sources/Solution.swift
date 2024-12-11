import Foundation

public func hoofIt(_ input: String) -> Int {
    
    let topographicMap = input.inputToTopographicMap()
    
    var totalScore = 0
    
    // Iterate the trail heads marked while converting the string to the model
    for trailhead in topographicMap.trailheads {
        
        // Use the recursive helper function in the model
        // Send the trailhead position and the next expected slope value
        totalScore += topographicMap.reachableNineHeights(
            currPos: trailhead,
            slope: 1).count
    }
    
    return totalScore
}

public func hoofItPartTwo(_ input: String) -> Int {
    
    let topographicMap = input.inputToTopographicMap()
    
    var totalRatings = 0
    
    // Iterate the trail heads marked while converting the string to the model
    for trailhead in topographicMap.trailheads {
        
        // Use the recursive helper function in the model
        // Send the trailhead position and the next expected slope value
        totalRatings += topographicMap.numOfPaths(
            currPos: trailhead,
            slope: 1)
    }
    
    return totalRatings
}
