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
    
    return 0
}

extension [[String]] {
    mutating func fencingCalculation(for pos: Pos) -> (a: Int, p: Int) {
        
        var result: (a: Int, p: Int) = (0, 0)
        
        // Add one for the area
        result.a += 1
        
        // Update the plot so it is known to be searched
        let currChar = self[pos.y][pos.x]
        self[pos.y][pos.x].append("#")
        
        // Add all the neighbors and clean out neighbors not on the map
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
