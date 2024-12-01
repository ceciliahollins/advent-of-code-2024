extension String {
    
    func inputToLocations() -> Locations {
        
        var locations = Locations()
            
        // Split the input string by newline characters
        let lines = self.split(separator: "\n")
        
        // Process each line
        for line in lines {
            
            // Split the line by spaces, and filter out any empty parts
            let components = line.split(separator: " ").map { String($0) }
            
            // Create the left and right integers
            if let left = Int(components[0]), let right = Int(components[1]) {
                // Append the left and right values to their respective lists
                locations.leftList.append(left)
                locations.rightList.append(right)
            }
        }
        
        return locations
    }
    
    func inputToLocationsPartTwo() -> LocationsPartTwo {
        
        var locations = LocationsPartTwo()
            
        // Split the input string by newline characters
        let lines = self.split(separator: "\n")
        
        // Process each line
        for line in lines {
            
            // Split the line by spaces, and filter out any empty parts
            let components = line.split(separator: " ").map { String($0) }
            
            // Create the left and right integers
            if let left = Int(components[0]), let right = Int(components[1]) {
                // Append the left and right values to their respective lists
                locations.leftList.append(left)
                locations.rightList[right] = (locations.rightList[right] ?? 0) + 1
            }
        }
        
        return locations
    }
}
