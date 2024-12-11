
struct TopographicMap {
    var map: [[Int]] = []
    var trailheads: [(Int, Int)] = []
    
    func reachableNineHeights(currPos: (x: Int, y: Int), slope: Int) -> Set<Pos> {
        
        // Create a set of locations for final trail positions
        var numOfReachables: Set<Pos> = []
        
        // Base case: if the slope value has reached 10, we can return the current position which was a value of 9
        if slope == 10 {
            return [Pos(currPos)]
        }
        
        // create the x and y directions to check
        let directions: [(x: Int, y: Int)] = [(-1, 0), (0, -1), (0, 1), (1, 0)]
        
        // Iterate the directions
        for dir in directions {
            
            // Create the new position based on the direction
            let newX = currPos.x + dir.x
            let newY = currPos.y + dir.y
            
            // Ensure the new position is on the map
            // Check the new value is the slope value desired
            if newX >= 0, newX < map[0].count,
               newY >= 0, newY < map.count,
               map[newY][newX] == slope {
                
                // Recursively call the function with the new position and expected slope height
                // Add the result to the set
                numOfReachables.formUnion(reachableNineHeights(
                    currPos: (newX, newY),
                    slope: slope + 1))
            }
        }
        
        // Return the set
        return numOfReachables
    }
    
    func numOfPaths(currPos: (x: Int, y: Int), slope: Int) -> Int {
        
        // Algorithm similar to reachableNineHeights
        
        var rating = 0
        
        // Base case: instead of returning the position, this entire trail can be added to the total and 1 can be returned
        if slope == 10 {
            return 1
        }
        
        let directions: [(x: Int, y: Int)] = [(-1, 0), (0, -1), (0, 1), (1, 0)]
        
        for dir in directions {
            let newX = currPos.x + dir.x
            let newY = currPos.y + dir.y
            
            if newX >= 0, newX < map[0].count,
               newY >= 0, newY < map.count,
               map[newY][newX] == slope {
                
                // Add the number of unique paths to a 9 height to the rating
                rating += numOfPaths(currPos: (newX, newY), slope: slope + 1)
            }
        }
        
        return rating
    }
}

// A hashable position struct to use in a set
struct Pos: Hashable {
    let x: Int
    let y: Int
    
    init(_ pos: (Int, Int)) {
        self.x = pos.0
        self.y = pos.1
    }
}

