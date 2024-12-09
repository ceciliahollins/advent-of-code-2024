import Foundation

public func guardGallivant(_ input: String) -> Int {
    
    var map = input.inputToMap()
    
    var visited: Set<Position> = [Position(map.guardPos.x, map.guardPos.y)]
    
    // We use a while true because we want to check the condition to continue not at the beginning or the end of the loop, but rather somewhere in the middle
    while true {
        
        // Get the next spot to move to
        let nextMove = map.move()

        // Check if the next move is within bounds
        // If out of the map, break the loop
        guard nextMove.x >= 0 && nextMove.x < map.positions[0].count &&
              nextMove.y >= 0 && nextMove.y < map.positions.count else {
            break
        }

        // If the next move is an object, change direction
        if map.positions[nextMove.y][nextMove.x] == .object {
            map.guardDirection = map.guardDirection.nextDirection
        } else {
            map.guardPos = nextMove
        }

        // Insert the move into the visited list, using the hashable Position
        visited.insert(Position(map.guardPos.x, map.guardPos.y))
    }
    
    return visited.count
}

public func guardGallivantPartTwo(_ input: String) -> Int {
    
    var map = input.inputToMap()
    
    // Track the possible blocks and visited positions
    var possibleBlocks: Set<Position> = []
    var visited: Set<Position> = [Position(map.guardPos.x, map.guardPos.y)]
        
    // Iterate the map similar to part 1
    while true {
        
        let nextMove = map.move()
        
        guard nextMove.x >= 0 && nextMove.x < map.positions[0].count &&
              nextMove.y >= 0 && nextMove.y < map.positions.count else {
            break
        }
        
        if map.positions[nextMove.y][nextMove.x] == .object {
            map.guardDirection = map.guardDirection.nextDirection
        } else {
            // Use the helper function to check if adding a block at the next move would produce a loop
            if isCycle(map, nextMove),
               // Check the the block is not being inserted into a position where the guard has already visited
               !visited.contains(Position(nextMove.x, nextMove.y)) {
                
                // Insert the move into the possible block tracker
                possibleBlocks.insert(Position(nextMove.x, nextMove.y))
            }
            
            map.guardPos = nextMove
            visited.insert(Position(map.guardPos.x, map.guardPos.y))
        }
    }
    
    return possibleBlocks.count
}

// A helper function to track if adding a block would produce a loop
func isCycle(_ map: Map, _ possibleBlock: (x: Int, y: Int)) -> Bool {
    
    // Add the possible block to the map
    var map = map
    map.positions[possibleBlock.y][possibleBlock.x] = .object
    
    // Track the visited positions, but this time the direction also needs to be tracked
    var visited: Set<PositionDirection> = [PositionDirection(map.guardPos.x, map.guardPos.y, map.guardDirection)]
        
    while true {
        
        let nextMove = map.move()
        
        guard nextMove.x >= 0 && nextMove.x < map.positions[0].count &&
              nextMove.y >= 0 && nextMove.y < map.positions.count else {
            break
        }
        
        if map.positions[nextMove.y][nextMove.x] == .object {
            map.guardDirection = map.guardDirection.nextDirection
        } else {
            map.guardPos = nextMove
        }
        
        // Check if this position and direction has already been visited, if yes then it is a loop
        if visited.contains(PositionDirection(map.guardPos.x, map.guardPos.y, map.guardDirection)) {
            return true
        }
        
        visited.insert(PositionDirection(map.guardPos.x, map.guardPos.y, map.guardDirection))
    }
    
    return false
}
