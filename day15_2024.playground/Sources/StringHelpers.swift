extension String {
    
    func inputToWarehouse() -> Warehouse {
        
        var robot = Pos(0, 0)
        var boxes: Set<Pos> = []
        var walls: Set<Pos> = []
        var floors: Set<Pos> = []
        var moves: [Dir] = []
            
        // Split the input string by newline characters
        let lines = self.split(separator: "\n")
                
        // Process each line
        for (y, line) in lines.enumerated() {
            
            // Process each character
            for (x, char) in line.enumerated() {
                
                // Add the components
                if let dir = Dir(rawValue: char) {
                    moves.append(dir)
                } else if char == "#" {
                    walls.insert(Pos(x, y))
                } else if char == "O" {
                    boxes.insert(Pos(x, y))
                } else if char == "@" {
                    robot = Pos(x, y)
                } else {
                    floors.insert(Pos(x, y))
                }
            }
        }
        
        return Warehouse(robot: robot, boxes: boxes, walls: walls, moves: moves)
    }
}

