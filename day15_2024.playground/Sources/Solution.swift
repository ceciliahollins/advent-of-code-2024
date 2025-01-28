import Foundation

public func warehouseWoes(_ input: String) -> Int {
    
    var w: Warehouse = input.inputToWarehouse()
    
    // Iterate moves to move the robot
    for dir in w.moves {
                
        // Set up for the next spot to move to
        var nextOpenSpot = w.robot.nextMove(dir)
        var openSpotFound = false
        // Continue moving until an open floor spot is found
        // If the next spot is a wall or an open spot is found- stop moving
        while !w.walls.contains(nextOpenSpot), !openSpotFound {
            // If the box positions does not contain the current spot, an open spot is found
            // Otherwise try the next spot
            if !w.boxes.contains(nextOpenSpot) {
                openSpotFound = true
            } else {
                nextOpenSpot = nextOpenSpot.nextMove(dir)
            }
        }
                
        // If an open floor spot is found, the robot and all the boxes in between need to be moved
        if openSpotFound {
            // Move the robot
            let nextRobotSpot = w.robot.nextMove(dir)
            w.robot = nextRobotSpot
            
            // If there is a box sitting at the next spot for the robot, some boxes need to be moved
            if w.boxes.contains(nextRobotSpot) {
                // Remove the box at the spot the robot is sitting at
                w.boxes.remove(nextRobotSpot)
                // Insert a box at the open spot
                w.boxes.insert(nextOpenSpot)
                // This process is the same as pushing all the boxes in the way of the robot
            }
        }
    }
    
    // Do the calculation for box positions
    var result = 0
    for box in w.boxes {
        result += (100 * box.y) + box.x
    }
    
    return result
}

public func warehouseWoesPartTwo(_ input: String) -> Int {
    
    return 0
}
