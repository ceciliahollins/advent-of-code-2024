extension String {
    
    func inputToAntennaMap() -> AntennaMap {
        
        var frequencies: [Character: [Pos]] = [:]
            
        // Split the input string by newline characters
        let lines = self.split(separator: "\n")
           
        // Process each line
        for (y, line) in lines.enumerated() {
            
            // Process each character
            for (x, char) in line.enumerated() {
                if char.isLetter || char.isNumber {
                    
                    // Add the position of the frequency to the dictionary
                    frequencies[char, default: []].append(Pos(x, y))
                }
            }
            
        }
        
        return AntennaMap(frequencies: frequencies,
                          mapSize: (lines[0].count - 1, lines.count - 1))
    }
}
