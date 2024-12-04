extension String {
    
    func inputToWordSearch() -> [[Character]] {
        
        var wordSearch: [[Character]] = []
            
        // Split the input string by newline characters
        let lines = self.split(separator: "\n")
        
        // Process each line
        for line in lines {
            wordSearch.append([])
            
            // Process each character
            for char in line {
                wordSearch[wordSearch.count - 1].append(char)
            }
        }
        
        return wordSearch
    }
}
