import Foundation

public func resonantCollinearity(_ input: String) -> Int {
    
    var antennaMap = input.inputToAntennaMap()
    
    // Iterate the frequency dictionary
    for frequency in antennaMap.frequencies {
        
        // Compare every frequency with every other frequency to find the antinodes
        let positions = frequency.value
        // Check every antenna position with all other antenna positions of the same kind
        for (i, pos) in positions.enumerated() {
            for pos2 in positions[(i + 1)...] {
                
                let freqDist: (x: Int, y: Int) = (pos.x - pos2.x, pos.y - pos2.y)
                                
                // Add an antidote relative to the first pos
                let antinodes1 = Pos(pos.x + freqDist.x, pos.y + freqDist.y)
                
                // Check that the antinode is on the map, then add it to the set
                if antennaMap.antinodeOnMap(antinodes1) {
                    antennaMap.antinodes.insert(antinodes1)
                }
                
                // Add an antidote relative to the second pos
                let antinodes2 = Pos(pos2.x - freqDist.x, pos2.y - freqDist.y)

                // Check that the antinode is on the map, then add it to the set
                if antennaMap.antinodeOnMap(antinodes2) {
                    antennaMap.antinodes.insert(antinodes2)
                }
            }
        }
        
    }
    
    return antennaMap.antinodes.count
}

public func resonantCollinearityPartTwo(_ input: String) -> Int {
    var antennaMap = input.inputToAntennaMap()
    
    // Execute the algorithm similar to part 1
    
    for frequency in antennaMap.frequencies {
        
        let positions = frequency.value
        for (i, pos) in positions.enumerated() {
            for pos2 in positions[(i + 1)...] {
                
                antennaMap.antinodes.insert(Pos(pos.x, pos.y))
                antennaMap.antinodes.insert(Pos(pos2.x, pos2.y))
                
                let freqDist: (x: Int, y: Int) = (pos.x - pos2.x, pos.y - pos2.y)
                                
                var antinodes1 = Pos(pos.x + freqDist.x, pos.y + freqDist.y)
                
                // Instead of checking if the single antinode is on the map, continually create antinodes until the position is off the map
                while antennaMap.antinodeOnMap(antinodes1) {
                    // Add the antinode to the set
                    antennaMap.antinodes.insert(antinodes1)
                    // Create the next antinode by adding the freqDist to the last position
                    antinodes1 = Pos(antinodes1.x + freqDist.x,
                                     antinodes1.y + freqDist.y)
                }
                
                // Same as antinode1, but relative to antinode2
                var antinodes2 = Pos(pos2.x - freqDist.x, pos2.y - freqDist.y)
                while antennaMap.antinodeOnMap(antinodes2) {
                    antennaMap.antinodes.insert(antinodes2)
                    antinodes2 = Pos(antinodes2.x - freqDist.x,
                                     antinodes2.y - freqDist.y)
                }
            }
        }
        
    }
    
    return antennaMap.antinodes.count
}
