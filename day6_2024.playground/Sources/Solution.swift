import Foundation

public func guardGallivant(_ input: String) -> Int {
    
    var map = input.inputToMap()
    
    var visited: Set<Position> = [Position(map.guardPos.x, map.guardPos.y)]
    
    // We use a while true because we want to check the condition to continue not at the beginning or the end of the loop, but rather somewhere in the middle
    while true {
        
        // Move to the next spot
        let nextMove = map.move()

        // Check if the next move is within bounds
        // If out of the map, break the loop
        guard nextMove.x >= 0 && nextMove.x < map.positions.count &&
              nextMove.y >= 0 && nextMove.y < map.positions.count else {
            break
        }

        // If the next move is an object, change direction then move again
        if map.positions[nextMove.y][nextMove.x] == .object {
            map.guardDirection = map.guardDirection.nextDirection
            map.guardPos = map.move()
        } else {
            map.guardPos = nextMove
        }

        // Insert the move into the visited list, using the hashable Position
        visited.insert(Position(map.guardPos.x, map.guardPos.y))
    }
    
    return visited.count
}

public func guardGallivantPartTwo(_ input: String) -> Int {
    return 0
}
