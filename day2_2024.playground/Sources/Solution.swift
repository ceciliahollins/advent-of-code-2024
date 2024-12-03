import Foundation

public func redNosedReports(_ input: String) -> Int {
    
    let report = input.inputToReport()
    var numOfSafeLevels: Int = 0
    
    // Iterate the levels to check for safety
    for l in report.levels {
        
        // Use the helper function to decide if the level is safe
        if levelIsSafe(l) {
            numOfSafeLevels += 1
        }
    }
    
    return numOfSafeLevels
}

public func redNosedReportsPartTwo(_ input: String) -> Int {
    
    let report = input.inputToReport()
    var numOfSafeLevels: Int = 0
    
    // Iterate the levels to check for safety
    for l in report.levels {
        
        // Use the helper function to decide if the level is safe
        if levelIsSafe(l) {
            numOfSafeLevels += 1
        } else {
            // If the level is not safe, try removing one value at a time to check if this will produce a safe level
            // As soon as a safe level is found, break the loop
            for i in 0..<l.level.count {
                // Create a new level with the current index removed
                var updatedLevel = l.level
                updatedLevel.remove(at: i)
                
                // Check for safety
                if levelIsSafe(Level(updatedLevel)) {
                    // If safe, add this level to the safe levels and break to the next level
                    numOfSafeLevels += 1
                    break
                }
            }
        }
    }
    
    return numOfSafeLevels
}

// This helper function is reused across both part 1 and part 2 to help decide if the level is safe or not based on the given rules
private func levelIsSafe(_ l: Level) -> Bool {
    // Iterate the vals in the level
    for i in 0..<l.level.count - 1 {
        // The direction of the level was decided when processing the input
        // switch the direction and check for any broken rules
        switch l.direction {
        case .increasing:
            // If any of the rules are broken, return false
            if l.level[i] >= l.level[i + 1]
                || l.level[i + 1] - l.level[i] > 3 {
                return false
            }
        case .decreasing:
            // If any of the rules are broken, return false
            if l.level[i] <= l.level[i + 1]
                || l.level[i] - l.level[i + 1] > 3 {
                return false
            }
        }
    }
    
    // If the end of the level is reached without any rules being broken, the level is safe
    return true
}
