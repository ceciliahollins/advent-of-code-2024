import Foundation

public func gardenGroups(_ input: String) -> Int {
    
    var plots = input.inputTo2DStringArray()
    
    var result = 0
    
    // Iterate the garden using a while loop, because the plot values will change
    var x = 0, y = 0
    while y < plots.count {
        while x < plots[y].count {
            
            // Plot values will be tagged with a # if it has been visited
            // No need to calculate this group if it has already been calculated
            if !plots[y][x].contains("#") {
                
                // Call the recursive function to get the area and perimeter
                let plotCalc = plots.fencingCalculation(for: Pos(x, y))
                result += plotCalc.a * plotCalc.p
            }
            
            x += 1
        }
        x = 0
        y += 1
    }
    
    return result
}

public func gardenGroupsPartTwo(_ input: String) -> Int {
    
    var plots = input.inputTo2DStringArray()
    
    var result = 0
    
    // Iterate the garden using a while loop, because the plot values will change
    var x = 0, y = 0
    while y < plots.count {
        while x < plots[y].count {
            
            // Plot values will be tagged with a # if it has been visited
            // No need to calculate this group if it has already been calculated
            if !plots[y][x].contains("#") {
                
                // Call the recursive function to get the area and perimeter
                let plotCalc = plots.fencingCalculationPartTwo(for: Pos(x, y))
                let sidesCalc = plots.sideCalculation(plotCalc.s)
                result += plotCalc.a * sidesCalc
            }
            
            x += 1
        }
        x = 0
        y += 1
    }
    
    return result
}

extension [[String]] {
    mutating func fencingCalculation(for pos: Pos) -> (a: Int, p: Int) {
        
        var result: (a: Int, p: Int) = (0, 0)
        
        // Add one for the area
        result.a += 1
        
        // Tag the plot so it is known to be searched
        let currChar = self[pos.y][pos.x]
        self[pos.y][pos.x].append("#")
        
        // Add all the neighbors and clean out neighbors not on the map or do not match its own type
        let possibleNeighbors: [Pos] = [pos.left, pos.right, pos.up, pos.down]
        let neighbors = possibleNeighbors.filter { $0.y >= 0 && $0.y < self.count && $0.x >= 0 && $0.x < self[$0.y].count
            && self[$0.y][$0.x].contains(currChar) }
        
        // Calculate the perimeter
        result.p += 4 - neighbors.count
        
        // Check it is on the map and the same character
        for n in neighbors {
            if !self[n.y][n.x].contains("#") {
                
                // DFS for that neighbors area and perimeter
                let neighborDFS = fencingCalculation(for: Pos(n.x, n.y))
                // Add the area and perimeter result
                result.a += neighborDFS.a
                result.p += neighborDFS.p
            }
        }
        
        return result
    }
    
    mutating func fencingCalculationPartTwo(for pos: Pos) -> (a: Int, s: [(Pos, Pos)]) {
        var result: (a: Int, s: [(Pos, Pos)]) = (0, [])
        
        // Add one for the area
        result.a += 1
        
        // Tag the plot so it is known to be searched
        let currChar = self[pos.y][pos.x]
        self[pos.y][pos.x].append("#")
        
        // Add all the neighbors
        // Create two neighbor variables
        // One will be the neighbors that are of the same type of char and need to be dfs searched
        // The other will be neighbors that are of a different type or off the map and represent a side
        let possibleNeighbors: [Pos] = [pos.left, pos.right, pos.up, pos.down]
        let neighborsToSearch = possibleNeighbors.filter { $0.y >= 0 && $0.y < self.count && $0.x >= 0 && $0.x < self[$0.y].count
            && self[$0.y][$0.x].contains(currChar) }
        let sideNeighbors = possibleNeighbors.filter { !neighborsToSearch.contains($0) }
        
        // Add pairs of neighbors into an array
        // The first value is the current char being searched, and the second is its outside neighbor
        // The pairs will sandwich the side in between them
        for n in sideNeighbors {
            let insidePos = Pos(pos.x, pos.y)
            let outsidePos = Pos(n.x, n.y)
            result.s.append((insidePos, outsidePos))
        }
        
        // Iterate the neighbors to search
        for n in neighborsToSearch {
            if !self[n.y][n.x].contains("#") {
                
                // DFS for that neighbors area and perimeter
                let neighborDFS = fencingCalculationPartTwo(for: Pos(n.x, n.y))
                // Add the area and perimeter result
                result.a += neighborDFS.a
                result.s.append(contentsOf: neighborDFS.s)
            }
        }
        
        return result
    }
    
    func sideCalculation(_ sides: [(Pos, Pos)]) -> Int {
        
        var sides = sides
        var numOfSides: Int = 0
        
        sides.sort { $0.0.y < $1.0.y }
        sides.sort { $0.0.y == $1.0.y && $0.0.x < $1.0.x }
        
        var currSide = sides[0]
        sides.removeFirst()
        
        // Iterate the array of side pairs
        while !sides.isEmpty {
            
            // Remove all the values that are on the same side as the current side
            var i = 0
            while i < sides.count {
                
                // Traverse up or down
                if currSide.0.x != currSide.1.x {
                  
                    // Check that the side being checked is the expected position directly below or above the current side
                    if (currSide.0.down == sides[i].0 && currSide.1.down == sides[i].1) // The next point is below
                        || (currSide.0.up == sides[i].0 && currSide.1.up == sides[i].1) { // The next point is above
                        
                        // The next position has been found, remove it and continue checking for the next side
                        currSide = sides[i]
                        sides.remove(at: i)
                        // Start the search over again
                        i = 0
                    } else {
                        // Still looking for the next position, go to the next
                        i += 1
                    }
                    
                // Traverse left or right
                } else {
                    
                    // Check that the side being checked is the expected position directly to the right or left of the current side
                    if (currSide.0.right == sides[i].0 && currSide.1.right == sides[i].1) // The next point is to the right
                        || (currSide.0.left == sides[i].0 && currSide.1.left == sides[i].1) { // The next point is to the left
                        
                        // The next position has been found, remove it and continue checking for the next side
                        currSide = sides[i]
                        sides.remove(at: i)
                        // Start the search over again
                        i = 0
                    } else {
                        // Still looking for the next position, go to the next
                        i += 1
                    }
                }
            }
            
            // We are finished finding all the values on the current side, add one and find the next side
            numOfSides += 1
            if let first = sides.first {
                currSide = first
                sides.removeFirst()
                
                // If that was the last value in the side list, add one for the final side
                if sides.isEmpty {
                    numOfSides += 1
                }
            }
        }
        
        return numOfSides
    }
    
    // A debugging function to print the garden
    func printGarden() {
        var line = ""
        for row in self {
            for char in row {
                line.append(char)
            }
            print(line)
            line = ""
        }
    }
}
