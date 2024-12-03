extension String {
    
    func inputToReport() -> Report {
        
        var report = Report()
            
        // Split the input string by newline characters
        let lines = self.split(separator: "\n")
        
        // Process each line
        for line in lines {
            
            // Create a new level
            var level: [Int] = []
            
            // Split the line by spaces
            let components = line.split(separator: " ")
            
            // Iterate the componenets in the line
            for component in components {
                // If the component is an Int, append it to the level
                if let val = Int(component) {
                    level.append(val)
                }
            }
            
            // Append the new level to the report
            report.levels.append(Level(level))
        }
        
        // Return the report
        return report
    }
}
