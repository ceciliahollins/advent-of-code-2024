extension String {
    
    func inputTo2DStringArray() -> [[String]] {
        
        var arr: [[String]] = []
        
        // Split by new line
        let lines = self.split(separator: "\n")
        
        // Iterate the lines
        for line in lines {
            
            arr.append([])
            
            // Iterate the chars
            for char in line {
                arr[arr.count - 1].append(String(char))
            }
        }
        
        return arr
    }
}
