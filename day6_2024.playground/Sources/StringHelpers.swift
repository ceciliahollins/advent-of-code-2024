extension String {
    
    func inputToMap() -> Map {
        
        var map = Map()
            
        // Split the input string by newline characters
        let lines = self.split(separator: "\n")
           
        // Process each line
        for line in lines {
            map.positions.append([])
            
            // Process each character
            for char in line {
                
                if char == "#" {
                    map.positions[map.positions.count - 1].append(.object)
                } else {
                    map.positions[map.positions.count - 1].append(.floor)
                    if char == "^" {
                        map.guardPos = (map.positions[map.positions.count - 1].count - 1,
                                        map.positions.count - 1)
                    }
                }
            }
        }
        
        return map
    }
}
