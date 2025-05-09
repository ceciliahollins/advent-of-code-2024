import Foundation

public func warehouseWoes(_ input: String) -> Int {
    
    var w: Warehouse = input.inputToWarehouse()
    
    // Iterate moves to move the robot
    for dir in w.moves {
                
        // Set up for the next spot to move to
        var openSpot = w.robot.nextMove(dir)
        var openSpotFound = false
        // Continue moving until an open floor spot is found
        // If the next spot is a wall or an open spot is found- stop moving
        while !w.walls.contains(openSpot), !openSpotFound {
            // If the box positions does not contain the current spot, an open spot is found
            // Otherwise try the next spot
            if !w.boxes.contains(openSpot) {
                openSpotFound = true
            } else {
                openSpot = openSpot.nextMove(dir)
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
                w.boxes.insert(openSpot)
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
    
    var w: WarehousePartTwo = input.inputToWarehousePartTwo()
    
    // Iterate moves to move the robot
    for dir in w.moves {
        
        // Use the recursive function to see if an open spot is available for the boxes to push to
        let openSpotFound = openSpotIsAvailable(dir, w.robot.nextMove(dir))
        
        // If there is an open spot, the boxes can be moved
        // Otherwise, just continue to the next move
        if openSpotFound {
            // Use the recursive function to move the boxes
            // The new value for the new box will be an open spot
            moveBoxes(dir, w.robot.nextMove(dir), newVal: ".")
            
            // Move the robot
            w.robot = w.robot.nextMove(dir)
        }
    }
    
    // Do the calculation for box positions
    var result = 0
    for (y, row) in w.map.enumerated() {
        for (x, char) in row.enumerated() {
            if char == "[" {
                result += (100 * y) + x
            }
        }
    }
    
    return result
    
    // A recursive function to check if a move is valid
    // If a box has a left or right side, both sides need to ensure they can push up or down for the move to be valid
    func openSpotIsAvailable(_ dir: Dir, _ currPos: Pos) -> Bool {
        
        // Base case: The current position is a wall or an open spot
        if w.map[currPos.y][currPos.x] == "#" {
            return false
        } else if w.map[currPos.y][currPos.x] == "." {
            return true
        }
        
        // The next position will be a box
        // Check that both sides of the box will have a valid open position to see if the move is valid
        switch dir {
        case .up, .down:
            let leftBox: Pos
            let rightBox: Pos
            if w.map[currPos.y][currPos.x] == "[" {
                leftBox = currPos.nextMove(dir)
                rightBox = Pos(leftBox.x + 1, leftBox.y)
            } else {
                rightBox = currPos.nextMove(dir)
                leftBox = Pos(rightBox.x - 1, rightBox.y)
            }
            
            // Recursively call the left side and right side of the box positions
            return openSpotIsAvailable(dir, leftBox)
            && openSpotIsAvailable(dir, rightBox)
            
        case .left, .right:
            // No special checks needed, recursively call the next position
            return openSpotIsAvailable(dir, currPos.nextMove(dir))
        }
    }
    
    // A recursive function to move the boxes to their next position
    // pre-req: the functions openSpotIsAvailable was run on the move and the current robot position can push all the boxes
    func moveBoxes(_ dir: Dir, _ currPos: Pos, newVal: Character) {
        
        // Base case: There are no more boxes to push
        if w.map[currPos.y][currPos.x] == "." {
            w.map[currPos.y][currPos.x] = newVal
            return
        }
        
        // A box needs to be pushed
        switch dir {
        case .up, .down:
            let leftBox: Pos
            let rightBox: Pos
            if w.map[currPos.y][currPos.x] == "[" {
                // Get the positions for the next move for the left and right box
                leftBox = currPos.nextMove(dir)
                rightBox = Pos(leftBox.x + 1, leftBox.y)
                
                // Update the current positions
                w.map[currPos.y][currPos.x] = newVal
                w.map[currPos.y][currPos.x + 1] = "."
            } else {
                rightBox = currPos.nextMove(dir)
                leftBox = Pos(rightBox.x - 1, rightBox.y)
                
                w.map[currPos.y][currPos.x] = newVal
                w.map[currPos.y][currPos.x - 1] = "."
            }
            
            // Recursively call the left side and right side of the box positions
            moveBoxes(dir, leftBox, newVal: "[")
            moveBoxes(dir, rightBox, newVal: "]")
            
            return
            
        case .left, .right:
            // No special checks needed, recursively call the next position
            moveBoxes(dir, currPos.nextMove(dir), newVal: w.map[currPos.y][currPos.x])
            w.map[currPos.y][currPos.x] = newVal
            return
        }
    }
}
