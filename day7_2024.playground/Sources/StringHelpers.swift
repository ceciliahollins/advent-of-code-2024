extension String {
    
    func inputToEquations() -> [Int: [Int]] {
        
        var equations: [Int: [Int]] = [:]
            
        // Split the input string by newline characters
        let lines = self.split(separator: "\n")
           
        // Process each line
        for line in lines {
            
            // Split the input string by the colon
            let operators = line.split(separator: ":")
            
            // Split out the test value and remaining numbers
            let testValue = Int(operators[0]) ?? 0
            let remainingNumbers = String(operators[1])
            
            // Add the test value to the equation
            equations[testValue] = []
            
            // Add the remaining numbers to the test value
            let nums = remainingNumbers.split(separator: " ")
            for num in nums {
                equations[testValue]?.append(Int(num) ?? 0)
            }
            
        }
        
        return equations
    }
}
