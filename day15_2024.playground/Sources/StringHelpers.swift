extension String {
    
    func inputToWarehouse() -> Warehouse {
        
        var robot = Pos(0, 0)
        var boxes: Set<Pos> = []
        var walls: Set<Pos> = []
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
                }
            }
        }
        
        return Warehouse(robot: robot, boxes: boxes, walls: walls, moves: moves)
    }
    
    func inputToWarehousePartTwo() -> WarehousePartTwo {
        
        var robot = Pos(0, 0)
        var map: [[Character]] = []
        var moves: [Dir] = []
            
        // Split the input string by newline characters
        let lines = self.split(separator: "\n")
                
        // Process each line
        for (y, line) in lines.enumerated() {
            
            map.append([])
            
            // Process each character
            for (x, char) in line.enumerated() {
                
                // Add the components
                if let dir = Dir(rawValue: char) {
                    moves.append(dir)
                } else if char == "#" {
                    map[map.count - 1].append(contentsOf: ["#", "#"])
                } else if char == "O" {
                    map[map.count - 1].append(contentsOf: ["[", "]"])
                } else if char == "@" {
                    robot = Pos(x, y)
                    map[map.count - 1].append(contentsOf: [".", "."])
                } else {
                    map[map.count - 1].append(contentsOf: [".", "."])
                }
            }
        }
        
        return WarehousePartTwo(robot: robot, map: map, moves: moves)
    }
}

