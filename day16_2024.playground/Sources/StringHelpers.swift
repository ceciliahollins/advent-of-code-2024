extension String {
    
    func inputToMaze() -> Maze {
        
        var map: [[Character]] = []
        var startPos: Pos = Pos(0, 0)
        var endPos: Pos = Pos(0, 0)
        
        // Split the input string by newline characters
        let lines = self.split(separator: "\n")
                
        // Process each line
        for (y, line) in lines.enumerated() {
            
            map.append([])
            
            // Process each character
            for (x, char) in line.enumerated() {
                
                // Add the components
                if char == "S" {
                    startPos = Pos(x, y)
                    map[map.count - 1].append(".")
                } else if char == "E" {
                    endPos = Pos(x, y)
                    map[map.count - 1].append(".")
                } else {
                    map[map.count - 1].append(char)
                }
            }
        }
        
        return Maze(map: map, startPos: startPos, endPos: endPos)
    }
}

