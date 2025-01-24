extension String {
    
    func inputToRobots() -> [Robot] {
        
        var robots: [Robot] = []
            
        // Split the input string by newline characters
        let lines = self.split(separator: "\n")
        
        // Process each line
        for line in lines {
            
            // Remove unneeded letters and signs
            let cleanedLine = line.filter { !$0.isLetter && !$0.isSymbol }
            
            // Split the line by spaces
            let components = cleanedLine.split(separator: " ")
            
            // Split the first set of integers
            // Force unwrap because if this doesn't work, something is wrong with the input
            let firstSet = components[0].split(separator: ",")
            let pos = GridPair(Int(firstSet[0])!, Int(firstSet[1])!)
            
            // Split the second set of integers
            // Force unwrap because if this doesn't work, something is wrong with the input
            let secondSet = components[1].split(separator: ",")
            let vel = GridPair(Int(secondSet[0])!, Int(secondSet[1])!)
            
            // Append the new robot to the robots array
            robots.append(Robot(pos: pos, vel: vel))
        }
        
        // Return the report
        return robots
    }
}
