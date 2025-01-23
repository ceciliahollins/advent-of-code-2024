import Foundation

extension String {
    
    func inputToClawMachine() -> [ClawMachine] {
        
        var clawMachines: [ClawMachine] = []
            
        // Split the input string by newline characters
        let lines = self.split(separator: "\n")
        
        // Process each line
        var curr = ClawMachine()
        for line in lines {
            
            if line.contains("Button A") {
                let tuple = extractButtonInts(String(line))
                curr.buttonA = Position(tuple.0, tuple.1)
            } else if line.contains("Button B") {
                let tuple = extractButtonInts(String(line))
                curr.buttonB = Position(tuple.0, tuple.1)
            } else if line.contains("Prize") {
                let tuple = extractPrizeInts(String(line))
                curr.prize = Position(tuple.0, tuple.1)
                
                clawMachines.append(curr)
                curr = ClawMachine()
            }
        }
        
        return clawMachines
    }
}

func extractButtonInts(_ input: String) -> (Int, Int) {
    // Extracting numbers from the string using a regular expression
    let regex = try! NSRegularExpression(pattern: "[-+]?\\d+")
    let matches = regex.matches(in: input, range: NSRange(input.startIndex..., in: input))

    // Converting matches into an array of integers
    let numbers = matches.compactMap {
        Int((input as NSString).substring(with: $0.range))
    }
    
    return (numbers[0], numbers[1])
}

func extractPrizeInts(_ input: String) -> (Int, Int) {
    // Extracting numbers from the string using a regular expression
    let regex = try! NSRegularExpression(pattern: "\\d+")
    let matches = regex.matches(in: input, range: NSRange(input.startIndex..., in: input))

    // Converting matches into an array of integers
    let numbers = matches.compactMap {
        Int((input as NSString).substring(with: $0.range))
    }
    
    return (numbers[0], numbers[1])
}
