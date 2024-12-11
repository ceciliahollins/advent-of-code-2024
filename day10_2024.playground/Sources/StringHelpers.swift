extension String {
    
    func inputToTopographicMap() -> TopographicMap {
        
        var topographicMap = TopographicMap()
            
        // Split the input string by newline characters
        let lines = self.split(separator: "\n")
           
        // Process each line
        for (y, line) in lines.enumerated() {
            
            topographicMap.map.append([])
            
            // Process each char
            for (x, char) in line.enumerated() {
                if let int = Int(String(char)) {
                    topographicMap.map[topographicMap.map.count - 1].append(int)
                    
                    // Keep track of the trailheads to make life easier later
                    if int == 0 {
                        topographicMap.trailheads.append((x, y))
                    }
                }
            }
            
        }
        
        return topographicMap
    }
}
